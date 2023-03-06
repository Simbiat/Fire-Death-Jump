// This event handles moving everything down so it looks like the player is moving up.
// Please refer to Part 1 of the tutorial for detailed information.
// If the player is in the upper half of the room
if moving {
	move_screen();

	// Apply touch input on X axis
	target_x += min(abs(touch_input_x), move_speed * 1.2) * sign(touch_input_x);

	// Smoothly interpolate touch input down to 0
	touch_input_x = lerp(touch_input_x, 0, 0.2);
}