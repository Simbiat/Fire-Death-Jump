function fillingWindow()
{
	with (my_smoke) {
		// Move the my_smoke instance
		// back on the window
		x = other.x;
		y = other.y + other.smoke_y_offset;
	
		// Change its alpha
		// It will be random meaning it's visible now
		// unless it's changed in the default case at the bottom
		image_alpha = random_range(0.4, 1);
	}

	// Roll a dice for what happens to this window
	// Value is between 0 and 3 (inclusive)
	// 0 - Civilian on this window
	// 1 - Fire on this window
	// 2 & 3 - Nothing
	//Changing this to increase chance of civillians in cas eof ghost mode
	chance = 3;
	if !secondary {
		if instance_exists(obj_player) && obj_player.ghost {
			if random_range(0, 100) <= 40 + obj_player.deaths*5 {
				chance = 0;
			} else {
				chance = irandom_range(1, 3);
			}
		} else {
			//Calculate fire chance based on height, to increase the challenge for every 1000 meters
			//Cap it at 80 percent, otherwise the end can be too difficult and there will be less blood
			var fireChance = min(20 + 5*(global.score_height/1000), 80);
			if random_range(0, 100) <= fireChance {
				chance = 1;
			} else {
				chance = choose(0, 2, 3);
			}
		}
	} else {
		//If parent window is on fire, have slightly lower chance of spawning a window with fire
		if parentOnFire {
			if random_range(0, 100) <= 15 {
				chance = 1;
			} else {
				//Need to also lower the chance of civilian, or it can result in too many of those
				if random_range(0, 100) <= 20 {
					chance = 0;
				} else {
					chance = 2;
				}
			}
		} else {
			if parentHasPerson {
				//Lower chance of also having a civillian
				if random_range(0, 100) <= 15 {
					chance = 0;
				} else {
					chance = irandom_range(1, 3);
				}
			} else {
				//Have a slightly higher chance of having a fire or a civillian
				if random_range(0, 100) <= 60 {
					chance = irandom_range(0, 1);
				} else {
					chance = 2;
				}
			}
		}
	}

	// Change frame to closed window by default
	// Either 0 or 1
	image_index = choose(0, 1);

	// Do something based on the random chance value we got
	switch (chance)
	{
		// Create civilian and change window frame to 2 which is used for civilians
		case 0:
			instance_create_layer(x, y, "Spawns", obj_fire_civilian); // Just a visual fire in the background
			
			instance_create_layer(x, y + 10, "Spawns", obj_civilian); // The actual civilian
		
			image_index = 2;
		break;
	
		// Create fire and change frame to 3 which is used for fire
		case 1:
			my_fire = instance_create_layer(x, y, "Spawns", obj_fire);
		
			image_index = 3;
		break;
	
		// If neither of the other cases ran
		default:
			// Set my_smoke's alpha to 0 so it disappears as the
			// window is now closed
			my_smoke.image_alpha = 0;
		break;
	}
}