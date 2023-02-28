if !selected {
	//Deselect all other buttons
	for (var i = 0; i < instance_number(obj_button_parent); ++i;) {
		button = instance_find(obj_button_parent, i);
		if button.selected {
			button.selected = false;
		}
	}
	// Hovering over mouse changes frame
	selected = true;

	// Play hover sfx
	audio_play_sound(snd_button_hover, 0, 0);
}