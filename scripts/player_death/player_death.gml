function permaDeath()
{
	if instance_exists(obj_game) {
		obj_game.gameOver = true;
		obj_game.alarm[0] = 1.5*room_speed;
		if obj_game.ghost_seq != noone {
			layer_sequence_destroy(obj_game.ghost_seq);
		}
	}
	instance_create_layer(x, y, "Player", obj_player_defeated);
	audio_play_sound(snd_rooster, 0, 0);
	screenshake(3, 10, 0.5);
	instance_destroy(obj_player);
}

function toGhost(fire = true)
{
	if instance_exists(obj_player) {
		if !obj_player.ghost {
			if obj_player.deaths >= 5 {
				//Perma death
				permaDeath();
			} else {
				obj_game.ghost_seq = layer_sequence_create("HUD", 0, 0, seq_to_ghost);
				obj_player.deaths += 1;
				obj_player.ghost = true;
				global.ghost_satiety = 10;
				global.ghost_timer = 150 - obj_player.deaths * 30;
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