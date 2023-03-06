// Check if menu music has loaded
var loaded = audio_sound_is_playable(snd_menu_music);

// If it loaded, play it
if (loaded) {
	if alarm[1] < 0 {
		if instance_exists(obj_game) && obj_game.gameOver {
			alarm[1] = 1.38*room_speed;
		} else {
			alarm[1] = room_speed;
		}
	}
} else {
	// Otherwise, run alarm after 30 steps to check again
	alarm[0] = 30;
}

//Check if any button is selected
if getSelectedButton() == noone {
	buttonSelection(true);
}