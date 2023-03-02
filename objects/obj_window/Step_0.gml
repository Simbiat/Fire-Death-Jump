if (y > room_height + 360) {
	// If the window is below the room, we are going to move it back above the room
	// so it can show up again
	// In this way we recycle windows instead of spawning new ones
	
	// Random x value in room, with 250 pixel margin
	if !secondary {
		var new_x = irandom_range(250, room_width - 250);
		// Go to that position
		x = new_x;
		y = -200;
		fillingWindow();
		//Logic to generate a secondary window
		//Check if there is enough space for a secondary window
		var toRight = bbox_right + 133 + sprite_width <= room_width;
		var toLeft = bbox_left - 133 - sprite_width >= 0;
		//Also do not generate secondary windows if we expect to show hints
		if !hint_fire && !hint_civilian && (toRight || toLeft) {
			//Roll the dice
			if (chance == 1 && random_range(0, 100) <= 35) || (chance != 1 && random_range(0, 100) <= 15) {
				//Generate secondary window
				if toRight {
					instance_create_layer(bbox_right + 266, y, "Instances", obj_window, {secondary: true, parentOnFire: chance == 1, parentHasPerson: chance == 0});
				} else {
					instance_create_layer(bbox_left - 266, y, "Instances", obj_window, {secondary: true, parentOnFire: chance == 1, parentHasPerson: chance == 0});
				}
			}
		}
	} else {
		//Destroy secondary windows
		instance_destroy();
	}
}