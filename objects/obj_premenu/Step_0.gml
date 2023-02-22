// Calculate alpha using current time and dsin()
alpha = 0.5 + dsin(current_time / 5) * 0.5;

//Exit game on escape key
if keyboard_check_pressed(vk_escape) {
	game_end();
}
// If mouse is pressed, go to main menu
if (mouse_check_button_pressed(mb_any) || keyboard_check_pressed(vk_anykey)) {
	room_goto(rm_menu);
}