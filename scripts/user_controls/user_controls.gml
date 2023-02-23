function isHoldingDown()
{
	if keyboard_check(vk_down) || mouse_check_button(mb_left) || keyboard_check(vk_numpad2) {
		return true;
	} else {
		return false;
	}
}