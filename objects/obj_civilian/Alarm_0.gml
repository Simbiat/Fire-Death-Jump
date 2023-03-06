/// @description Killing code
if !untouchable {
	untouchable = true;
	// Switch from the transition sprite to the killed sprite based on the civilian type
	switch (sprite_index)
	{
		case spr_civilian_transition_0:
			sprite_index = spr_civilian_killed_0;
		break;

		case spr_civilian_transition_1:
			sprite_index = spr_civilian_killed_1;
		break;

		case spr_civilian_transition_2:
			sprite_index = spr_civilian_killed_2;
		break;
	
		case spr_civilian_transition_3:
			sprite_index = spr_civilian_killed_3;
		break;
	}

	// Make it jump and enable gravity
	vspeed = -18;
	gravity = 0.5;

	// Change depth to appear above player
	if instance_exists(obj_player) {
		depth = obj_player.depth - 10;
	}

	if killed {
		if sprite_index == spr_civilian_killed_0 || sprite_index == spr_civilian_killed_1 {
			audio_play_sound(snd_fall_male, 0, 0);
		} else {
			audio_play_sound(snd_fall_female, 0, 0);
		}
	} else if eaten {
		if sprite_index == spr_civilian_killed_0 || sprite_index == spr_civilian_killed_1 {
			audio_play_sound(snd_fall_male, 0, 0, 0.5, 0, 0.5);
		} else {
			audio_play_sound(snd_fall_female, 0, 0, 0.5, 0, 0.5);
		}
	}

	//Change depth to appear belor player.
	//Needed, because if there are too many of civilians on screen, you can loose player model
	alarm[1] = room_speed;
}