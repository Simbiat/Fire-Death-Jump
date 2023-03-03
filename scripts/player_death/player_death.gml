function permaDeath(manual = false)
{
	if instance_exists(obj_game) {
		obj_game.gameOver = true;
		obj_game.alarm[0] = 1.5*room_speed;
		if obj_game.ghost_seq_to != noone {
			fromGhost();
		}
	}
	instance_create_layer(obj_player.x, obj_player.y, "Player", obj_player_defeated);
	instance_destroy(obj_player);
	if !manual {
		audio_play_sound(snd_rooster, 0, 0);
		screenshake(3, 10, 0.5);
	} else {
		audio_play_sound(snd_player_defeat_fire, 0, 0);
	}
}

function toGhost(fire = true)
{
	if instance_exists(obj_player) {
		if !obj_player.ghost {
			if obj_player.deaths >= 5 {
				//Perma death
				permaDeath();
			} else {
				obj_game.ghost_seq_to = layer_sequence_create("HUD", 0, 0, seq_to_ghost);
				obj_player.deaths += 1;
				obj_player.ghost = true;
				global.ghost_satiety = 10;
				global.ghost_timer = 100 - obj_player.deaths * 10;
				global.first_civilian = true;
				global.first_fire = true;
				//Stop hint timers
				obj_player.alarm[2] = -1;
				obj_player.alarm[3] = -1;
				//Shake screen
				screenshake(3, 5, 0.5);
				// Play sound for when fire defeats the player
				if fire {
					audio_play_sound(snd_player_defeat_fire, 0, 0);
				} else {
					audio_play_sound(snd_player_defeat_bottom, 0, 0);
				}
			}
		}
	}
}

function fromGhost()
{
	global.ghost_satiety = 0;
	global.first_civilian = true;
	global.first_fire = true;
	//Stop hint timers
	obj_player.alarm[2] = -1;
	obj_player.alarm[3] = -1;
	if instance_exists(obj_player) {
		obj_player.ghost = false;
	}
	if instance_exists(obj_corn_seed) {
		instance_destroy(obj_corn_seed);
	}
	if instance_exists(obj_player) {
		if obj_game.ghost_seq_to != noone {
			layer_sequence_destroy(obj_game.ghost_seq_to);
			obj_game.ghost_seq_to = noone;
			obj_game.alarm[1] = room_speed;
			obj_game.ghost_seq_from = layer_sequence_create("HUD", 0, 0, seq_from_ghost);
		}
	}
}