function isHoldingDown()
{
	//Hold jumping if ghost sequence is being played out
	if room == rm_game {
		if obj_game.ghost_seq_to != noone && !layer_sequence_is_finished(obj_game.ghost_seq_to) {
			return true;
		}
		if keyboard_check(vk_down) || mouse_check_button(mb_left) || keyboard_check(vk_numpad2) ||  keyboard_check(ord("S")) {
			return true;
		} else {
			return false;
		}
	} else {
		return false;	
	}
}

function nextTutorial()
{
	if keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_numpad6) ||
		keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_numpad8) ||  keyboard_check_pressed(ord("W")) ||
		keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) {
		if instance_exists(obj_next) {
			with (obj_next) {
				event_user(0);
			}
		}
	}
}

function playerMovement()
{
	if (gravity > 0) {
		if keyboard_check(vk_left) || keyboard_check(ord("A")) || keyboard_check(vk_numpad4) {
			// Move target X left
			target_x -= move_speed;
			//Counter-intuitevly we need to use "+ sprite_width", and not "-", because at this point
			//the sprite is reversed
			//+25 is to allow the sprite's hands to touch the edge as closely as possible
			if collision_line(target_x, y, target_x + sprite_width/2 + 25, y, left_wall, false, true) {
				target_x = xprevious;
			}
		}
		if keyboard_check(vk_right) || keyboard_check(ord("D")) || keyboard_check(vk_numpad6) {
			// Move target X left
			target_x += move_speed;
			//-25 is to allow the sprite's hands to touch the edge as closely as possible
			if collision_line(target_x, y, target_x + sprite_width/2 - 25, y, right_wall, false, true) {
				target_x = xprevious;
			}
		}
	}
}

function getSelectedButton()
{
	var buttonSelected = noone;
	for (var i = 0; i < instance_number(obj_button_parent); ++i;) {
		button = instance_find(obj_button_parent, i);
		if button.selected {
			buttonSelected = button.object_index;
		}
	}
	return buttonSelected;
}

//React to arrows up and down (to navigate menu)
function buttonSelection(fromCode = false)
{
	//There is probably a much better solution to move around menus, but this should suffice
	if keyboard_check_pressed(vk_down) ||  keyboard_check_pressed(vk_up) || fromCode {
		//Iterrate through existing buttons determining which one is selected and deselecting all of them
		var buttonSelected = getSelectedButton();
		with (obj_button_parent) {
			selected = false;
		}
		//Determine the new button based on what button was selected
		var newButton = noone;
		switch (buttonSelected) {
			//First 2 variables are for gameover screen
		    case obj_button_menu:
		        newButton = obj_button_replay;
		        break;
			case obj_button_replay:
		        newButton = obj_button_menu;
		        break;
			//Next 3 are for the main menu
			case obj_button_play:
				if keyboard_check_pressed(vk_down) {
					newButton = obj_button_tutorial;
				} else {
					newButton = obj_button_quit;
				}
		        break;
			case obj_button_quit:
		        if keyboard_check_pressed(vk_down) {	
					newButton = obj_button_play;
				} else {
					newButton = obj_button_tutorial;
				}
		        break;
			case obj_button_tutorial:
		        if keyboard_check_pressed(vk_down) {	
					newButton = obj_button_quit;
				} else {
					newButton = obj_button_play;
				}
		        break;
		    default:
		        if instance_exists(obj_button_replay) {
					newButton = obj_button_replay;
				} else if instance_exists(obj_button_play) {
					newButton = obj_button_play;
				}
		        break;
		}
		with (newButton) {
			selected = true;
			if !fromCode {
				audio_play_sound(snd_button_hover, 0, 0);
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
		} else if room == rm_tutorial {
			room_goto(rm_menu);
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