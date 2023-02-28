function isHoldingDown()
{
	//Hold jumping if ghost sequence is being played out
	if obj_game.ghost_seq_to != noone && !layer_sequence_is_finished(obj_game.ghost_seq_to) {
		return true;
	}
	if keyboard_check(vk_down) || mouse_check_button(mb_left) || keyboard_check(vk_numpad2) ||  keyboard_check(ord("S")) {
		return true;
	} else {
		return false;
	}
}

function playerMovement()
{
	if (gravity > 0) {
		if keyboard_check(vk_left) || keyboard_check(ord("A")) || keyboard_check(vk_numpad4) {
			// Move target X left
			target_x -= move_speed;
		}
		if keyboard_check(vk_right) || keyboard_check(ord("D")) || keyboard_check(vk_numpad6) {
			// Move target X left
			target_x += move_speed;
		}
	}
}

//React to arrows up and down (to navigate menu)
function buttonSelection()
{
	
	if keyboard_check_pressed(vk_down) ||  keyboard_check_pressed(vk_up) {
		//Iterrate through existing buttons
		var buttonSelected = false;
		for (var i = 0; i < instance_number(obj_button_parent); ++i;) {
			button = instance_find(obj_button_parent, i);
			if button.selected {
				button.selected = false;
			} else {
				if !buttonSelected {
					button.selected = 1;
					buttonSelected = true;
					audio_play_sound(snd_button_hover, 0, 0);
				}
			}
		}
	}
}

function buttonUse()
{
	if keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) {
		for (var i = 0; i < instance_number(obj_button_parent); ++i;) {
			button = instance_find(obj_button_parent, i);
			if button.selected {
				//Run event linked to it in user event
				with (button) {
					event_user(0);
				}
			}
		}
	}
}

function buttonEscape()
{
	if keyboard_check_pressed(vk_escape) {
		if instance_exists(obj_player) {
			permaDeath(true);
		} else if instance_exists(obj_button_menu) {
			with (obj_button_menu) {
				event_user(0);
			}
		} else if instance_exists(obj_button_quit) {
			with (obj_button_quit) {
				event_user(0);
			}
		}
	}
}