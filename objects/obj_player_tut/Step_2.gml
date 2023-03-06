if moving {
	// If the player is falling down
	if (vspeed > 0)
	{
		// and the current sprite is the in-air sprite
		if (sprite_index == sprite_air)
		{
			// Start in-air to fall transition
			sprite_index = sprite_air_to_fall;
			image_index = 0;
		}
	}

	// If gravity is >0 meaning that the player is not
	// charging for a jump and can move around
	if (gravity > 0)
	{

		// Use lerp to smoothly move the x towards target_x
		// The third argument is how quick it is, range is 0-1
		// Lower value, smoother but slower
		// Higher value, snaps but faster
		x = lerp(x, target_x, 0.1);

		// x - xprevious gets the movement
		// for the current step on the x axis,
		// by comparing the current and previous
		// x coordinates
		// If it's >4 it means we moved right
		// 4 is just our threshold for moving in
		// a direction, also gives the player more
		// weight
		var _x_movement = x - xprevious;
		if (_x_movement > 4)
		{
			// So we set the scale to normal
			image_xscale = 1;
		}
		// Otherwise
		else
		{
			// If it's <-4 it means we moved left
			if (_x_movement < -4)
			{
				// So we flip the sprite
				image_xscale = -1;
			}
		}
	}
}