/// @description Menu navigation
//React to arrows up and down (to navigate menu)
if keyboard_check_pressed(vk_down) ||  keyboard_check_pressed(vk_up) {
	//Iterrate through existing buttons
	var buttonSelected = false;
	for (var i = 0; i < instance_number(obj_button_parent); ++i;) {
		button = instance_find(obj_button_parent, i);
		if button.image_index != 0 {
			button.image_index = 0;
		} else {
			if !buttonSelected {
				button.image_index = 1;
				buttonSelected = true;
			}
		}
	}
}
//React to Enter and Space
if keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) {
	if image_index == 1 {
		//Run event linked to it in user event
		event_user(0);
	}
	for (var i = 0; i < instance_number(obj_button_parent); ++i;) {
		button = instance_find(obj_button_parent, i);
		if button.image_index == 1 {
			//Run event linked to it in user event
			with (button) {
				event_user(0);
			}
		}
	}
}
//Return to previous menu
if keyboard_check_pressed(vk_escape) {
	if instance_exists(obj_button_menu) {
		with (obj_button_menu) {
			event_user(0);
		}
	} else if instance_exists(obj_button_quit) {
		with (obj_button_quit) {
			event_user(0);
		}
	}
}