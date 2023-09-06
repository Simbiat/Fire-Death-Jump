function permaDeath(_timer = false)
{
	//Does not make sense to trigger if there is no player (for example during intro)
	if instance_exists(obj_player) && obj_player.x != 0 && obj_player.y != 0 {
		if instance_exists(obj_game) {
			obj_game.gameOver = true;
			obj_game.alarm[0] = 1.5*room_speed;
			if obj_game.ghost_seq_to != noone {
				fromGhost();
			}
			//Destroy skull icons
			if (array_length(obj_game.death_seqs) > 0) {
				for (var _i = 0; _i < array_length(obj_game.death_seqs); ++_i) {
					if obj_game.death_seqs[_i] != noone {
						layer_sequence_destroy(obj_game.death_seqs[_i]);
						obj_game.death_seqs[_i] = noone;
					}
				}
			}
		}
		instance_create_layer(obj_player.x, obj_player.y, "Player", obj_player_defeated);
		instance_destroy(obj_player);
		//Destroy fire on earth, if still on screen, so that they do not cover the menu button
		//Normally, it's unlikely to be required, but better be safe
		instance_destroy(earth_fire_1);
		instance_destroy(earth_fire_2);
		instance_destroy(earth_fire_3);
		instance_destroy(earth_fire_4);
		if _timer {
			audio_play_sound(snd_rooster, 0, 0, 0.5);
		} else {
			audio_play_sound(snd_player_defeat_fire, 0, 0);
		}
		screenshake(3, 10, 0.5);
	}
}

function toGhost(tutorial = false)
{
	if tutorial == false {
		if instance_exists(obj_player) {
			if !obj_player.ghost {
				if obj_player.deaths >= 5 {
					//Perma death
					permaDeath();
				} else {
					obj_player.deaths += 1;
					obj_game.death_seqs[obj_player.deaths - 1] = layer_sequence_create("HUDSequences", 0, 0, asset_get_index("seq_death_" + string(obj_player.deaths)));
					obj_game.ghost_seq_to = layer_sequence_create("HUDSequences", 0, 0, seq_to_ghost);
					obj_player.ghost = true;
					//Reset globals
					global.ghost_satiety = 10;
					//Timer is reduced by 10 seconds but should not be less than 20 seconds (otherwise it is next to unbeatable even with increased chances)
					global.ghost_timer = max(70 - obj_player.deaths * 10, 25);
					global.first_civilian = true;
					global.first_fire = true;
					//Stop hint timers
					obj_game.alarm[2] = -1;
					obj_game.alarm[3] = -1;
					//Shake screen
					screenshake(3, 5, 0.5);
					audio_play_sound(snd_player_defeat_fire, 0, 0);
					//Change audio track
					var audioOffset = audio_sound_get_track_position(obj_game.current_music);
					audio_stop_sound(obj_game.current_music);
					obj_game.current_music = audio_play_sound(snd_ghost_mode, 0, 1, 1, audioOffset);
				}
			}
		}
	} else {
		if instance_exists(obj_player_tut) {
			obj_player_tut.deaths += 1;
			obj_tutorial.death_seqs[obj_player_tut.deaths - 1] = layer_sequence_create("HUDSequences", 0, 0, asset_get_index("seq_death_" + string(obj_player_tut.deaths)));
			obj_tutorial.ghost_seq_to = layer_sequence_create("HUDSequences", 0, 0, seq_to_ghost);
			obj_player_tut.ghost = true;
			//Shake screen
			screenshake(3, 5, 0.5);
			audio_play_sound(snd_player_defeat_fire, 0, 0);
		}
	}
}

function fromGhost(tutorial = false)
{
	global.ghost_satiety = 0;
	global.first_civilian = true;
	global.first_fire = true;
	//Stop hint timers
	if tutorial {
		if instance_exists(obj_player_tut) {
			obj_player_tut.ghost = false;
		}
	} else {
		obj_player.alarm[2] = -1;
		obj_player.alarm[3] = -1;
		if instance_exists(obj_player) {
			obj_player.ghost = false;
		}
	}
	if instance_exists(obj_corn_seed) {
		instance_destroy(obj_corn_seed);
	}
	if !tutorial && instance_exists(obj_player) {
		if obj_game.ghost_seq_to != noone {
			layer_sequence_destroy(obj_game.ghost_seq_to);
			obj_game.ghost_seq_to = noone;
			obj_game.alarm[1] = room_speed;
			obj_game.ghost_seq_from = layer_sequence_create("HUDSequences", 0, 0, seq_from_ghost);
			//Change audio track
			var audioOffset = audio_sound_get_track_position(obj_game.current_music);
			audio_stop_sound(obj_game.current_music);
			obj_game.current_music = audio_play_sound(snd_game_music, 0, 1, 1, audioOffset);
		}
	} else if tutorial {
		layer_sequence_destroy(obj_tutorial.ghost_seq_to);
		obj_tutorial.alarm[1] = room_speed;
		obj_tutorial.ghost_seq_from = layer_sequence_create("HUDSequences", 0, 0, seq_from_ghost);
	}
}

function civilianDeath()
{
	// If civilian is not killed yet
	if (killed == false && eaten == false) {
		if other.ghost && !other.tutorial {
			if other.vspeed == 0 {
				if hp > 0 {
					//Add a little bit of blood if we are not holding down
					if alarm[3] < 0 {
						if !isHoldingDown() {
							if alarm[2] < 0 {
								if hp == 0 {
									//Synchronize with the "death" alarm
									alarm[2] = 4;
								} else {
									global.score_blood += random_range(0.2, 0.5);
									hp -= 1;
									audio_play_sound(snd_civilian_feed, 0, 0);
									alarm[2] = 0.9*room_speed;
								}
							}
						} else {
							switch(sprite_index) {
								case spr_civilian_0:
									sprite_index = spr_civilian_scared_0;
									break;
								case spr_civilian_1:
									sprite_index = spr_civilian_scared_1;
									break;
								case spr_civilian_2:
									sprite_index = spr_civilian_scared_2;
									break;
								case spr_civilian_3:
									sprite_index = spr_civilian_scared_3;
									break;
							}
							if hp == 0 {
								//Synchronize with the "death" alarm
								alarm[3] = 4;
							} else {
								alarm[3] = 1*room_speed;
							}
						}
					}
				} else {
					// Set eaten to true
					eaten = true;
					//Change sprite for player if we were feeding
					if other.sprite_index == other.sprite_attack {
						other.sprite_index = other.sprite_hold_jump;
					}
				}
			}
		} else {
			if hp < 3 {
				//We will be here, if civilian dies during feeding
				eaten = true;
			} else {
				// Increase blood score
				global.score_blood += random_range(4.5, 5.7);
				// Set killed to true
				killed = true;
			}
		}
	}
	if killed || eaten {
		// Change sprite to transition sprite depending on current sprite
		switch(sprite_index) {
			case spr_civilian_0:
				sprite_index = spr_civilian_transition_0;
				break;
			case spr_civilian_1:
				sprite_index = spr_civilian_transition_1;
				break;
			case spr_civilian_2:
				sprite_index = spr_civilian_transition_2;
				break;
			case spr_civilian_3:
				sprite_index = spr_civilian_transition_3;
				break;
			case spr_civilian_scared_0:
				sprite_index = spr_civilian_transition_0;
				break;
			case spr_civilian_scared_1:
				sprite_index = spr_civilian_transition_1;
				break;
			case spr_civilian_scared_2:
				sprite_index = spr_civilian_transition_2;
				break;
			case spr_civilian_scared_3:
				sprite_index = spr_civilian_transition_3;
				break;
		}
		// Set alarm to end transition and make civilian jump
		if alarm[0] < 0 {
			alarm[0] = 4;
		}
	}
}