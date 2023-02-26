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