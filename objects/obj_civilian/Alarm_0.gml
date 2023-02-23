/// @description Killing code
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
}

// Make it jump and enable gravity
vspeed = -18;
gravity = 0.5;

// Change depth to appear above player
if instance_exists(obj_player) {
	depth = obj_player.depth - 10;
}

// Play fall sound (player's fall sound but with a lower pitch)
snd = audio_play_sound(snd_player_fall, 0, 0);

audio_sound_pitch(snd, random_range(0.6, 0.7));

audio_sound_gain(snd, 0.5, 0);

//Change depth to appear belor player.
//Needed, because if there are too many of civilians on screen, you can loose player model
alarm[1] = room_speed;