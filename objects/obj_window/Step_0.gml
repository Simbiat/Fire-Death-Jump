if (y > room_height + 360) {
	// If the window is below the room, we are going to move it back above the room
	// so it can show up again
	// In this way we recycle windows instead of spawning new ones
	
	// Random x value in room, with 250 pixel margin
	if !secondary && !tutorial {
		var new_x = irandom_range(250, room_width - 250);
		// Go to that position
		x = new_x;
		y = -200;
		fillingWindow();
		createSecondaryWindow();
	} else {
		//Destroy secondary and tutorial windows
		instance_destroy();
	}
}