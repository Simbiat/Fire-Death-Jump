// Is the current blood score greater than the blood highscore?
if (global.score_blood > global.highscore_blood)
{
	// Update the blood highscore to be equal to the blood score
	global.highscore_blood = global.score_blood;

	// Play highscore sound
	audio_play_sound(snd_highscore, 0, 0);

	// Create gold particles
	repeat (30)
	{
		instance_create_layer(irandom_range(bbox_left, bbox_right), y, "TopLayer", obj_gold_particle);
	}

	// Run Alarm 1 after 1 step, to start animation
	alarm[1] = 1;
}