function createSecondaryWindow()
{
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
}

function fillingWindow()
{
	//Reset some settings
	has_fire = false;
	hint_fire = false;
	has_civilian = false;
	hint_civilian = false;
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
	
	//Calculate fire/civilian chance based on height, to increase the challenge 
	//and potential reward for every 500 meters. Cap fire at 45% and civilians at 55%
	var fireChance = min(20 + 5*(global.score_height/500), 45);
	var civChance = min(20 + 5*(global.score_height/500), 55);
	// Roll a dice for what happens to this window
	// Value is between 0 and 3 (inclusive)
	// 0 - Civilian on this window
	// 1 - Fire on this window
	// 2 & 3 - Nothing
	//Changing this to increase chance of civillians in case of ghost mode
	chance = 3;
	if !secondary {
		if instance_exists(obj_player) && obj_player.ghost {
			if random_range(0, 100) <= 40 + obj_player.deaths*5 + 50/global.ghost_timer {
				chance = 0;
			} else {
				chance = irandom_range(1, 3);
			}
		} else {
			var heightChance = random_range(0, 100);
			if heightChance <= fireChance {
				chance = 1;
			} else if heightChance <= fireChance + civChance {
				chance = 0;
			} else {
				chance = 2;
			}
		}
	} else {
		//If parent window is on fire, have slightly lower chance of spawning a window with fire
		if parentOnFire {
			if random_range(0, 100) <= fireChance - 15 {
				chance = 1;
			} else {
				//Need to also lower the chance of civilian, or it can result in too many of those
				if random_range(0, 100) <= civChance - 20 {
					chance = 0;
				} else {
					chance = 2;
				}
			}
		} else {
			if parentHasPerson {
				//Lower chance of also having a civillian
				if random_range(0, 100) <= civChance - 15 {
					chance = 0;
				} else {
					chance = irandom_range(1, 3);
				}
			} else {
				//Have a slightly higher chance of having a fire or a civillian
				if random_range(0, 100) <= civChance + 10 {
					chance = irandom_range(0, 1);
				} else {
					chance = 2;
				}
			}
		}
	}

	// Change frame to closed window by default
	// Either 0 or 1
	image_index = irandom_range(0, 4);

	// Do something based on the random chance value we got
	switch (chance)
	{
		// Create civilian and change window frame to 2 which is used for civilians
		case 0:
			has_civilian = true;
			instance_create_layer(x, y, "Spawns", obj_fire_civilian); // Just a visual fire in the background
			
			instance_create_layer(x, y + 10, "Spawns", obj_civilian); // The actual civilian
		
			image_index = irandom_range(5, 10);
		break;
	
		// Create fire and change frame to 3 which is used for fire
		case 1:
			has_fire = true;
			my_fire = instance_create_layer(x, y, "Spawns", obj_fire);
		
			image_index = irandom_range(11, 16);
		break;
	
		// If neither of the other cases ran
		default:
			// Set my_smoke's alpha to 0 so it disappears as the
			// window is now closed
			my_smoke.image_alpha = 0;
		break;
	}
	if global.first_civilian && has_civilian {
		hint_civilian = true;
		windowHintVariables();
		global.first_civilian = false;
		//Set timer to reset hint
		obj_game.alarm[3] = 60*room_speed;
	}
	if global.first_fire && has_fire {
		hint_fire = true;
		windowHintVariables();
		global.first_fire = false;
		//Set timer to reset hint
		obj_game.alarm[2] = 60*room_speed;
	}
}

function windowHintVariables()
{
	//Choose words
	if hint_civilian {
		if instance_exists(obj_player) && obj_player.ghost {
			word1 = "hold";
			word2 = "me";
			word3 = "down";
		} else {
			word1 = "hurt";
			word2 = "me";
			word3 = "plenty";
		}
	} else if hint_fire {
		if instance_exists(obj_player) && obj_player.ghost {
			word1 = "not";
			word2 = "so";
			word3 = "hot";
		} else {
			word1 = "not";
			word2 = "too";
			word3 = "close";
		}
	}
	//Calculate max widths and max heights of the selected words
	var maxWidth, maxHeight, totalWidth, totalHeight;
	//While we are not drawing here, we need to sent font so that width of text is calculated properly
	draw_set_font(global.blood_font);
	maxWidth = max(string_width(word1), string_width(word2), string_width(word3))*global.blood_font_scale;
	maxHeight = max(string_height(word1), string_height(word2), string_height(word3))*global.blood_font_scale;
	totalHeight = (string_height(word1) + string_height(word2) + string_height(word3))*global.blood_font_scale;
	totalWidth = (string_width(word1) + string_width(word2) + string_width(word3))*global.blood_font_scale;
	//Determine on which side of the window the words will be
	var toLeft = noone, toRight = noone, toBottom = noone;
	toLeft = collision_rectangle(bbox_left, bbox_top, 0, bbox_bottom, obj_window, false, true);
	toRight = collision_rectangle(bbox_right, bbox_top, room_width, bbox_bottom, obj_window, false, true);
	toBottom = collision_rectangle(x - totalWidth, y + 120, x + totalWidth, y + 120 + maxHeight*2 + sprite_height*0.75, obj_window, false, true);
	//Minimum offsets for left and right. Based on sprite's width since bbox does not cover whole image
	var leftOffset = -sprite_width/2 - 30;
	var rightOffset = sprite_width/2 + 30;
	//Check if there is enough space to left or right, if there no collisions
	if toLeft == noone {
		if x + leftOffset - maxWidth >= 0 {
			toLeft = true;
		} else {
			toLeft = false;
		}
	}
	if toRight == noone {
		if x + rightOffset + maxWidth <= room_width {
			toRight = true;
		} else {
			toRight = false;
		}
	}
	//For bottom it's enough to know that we have not collisions
	if toBottom == noone {
		toBottom = true;
	} else {
		toBottom = false;
	}
	//Handle choice in case multiple spaces are available
	//0 - left, 1 - right, 2 - bottom
	var choice = 2;
	//Randomization if we have all 3 available
	if toLeft && toRight && toBottom {
		choice = choose(0, 1, 2);
	} else {
		//Randomization for 2 placements
		if toLeft && toRight {
			choice = choose(0, 1);
		} else if toLeft && toBottom {
			choice = choose(0, 2);
		} else if toRight && toBottom {
			choice = choose(1, 2);
		} else {
			//Value for 1 position
			if toLeft {
				choice = 0;
			} else if toRight {
				choice = 1;
			} else {
				choice = 2;
			}
		}
	}
	//Determine actual coordinates based on choice
	switch (choice) {
		case 0:
			//Align based on the 2nd word
			//I have not found a reason why I need to add 70 in these calculations.
			posX2 = random_range(-x + 70, leftOffset - maxWidth);
			posY2 = random_range(bbox_top + totalHeight/2, bbox_bottom + totalHeight/3);
			posX1 = posX2 + random_range(-string_width(word1)*global.blood_font_scale - 40, string_width(word2)*global.blood_font_scale + 40);
			//Adjust if 1st word is out of bounds
			if posX1 < -x + 70 {
				posX1 = -x + 70;
			}
			if posX1 > leftOffset - string_width(word1)*global.blood_font_scale {
				posX1 = leftOffset - string_width(word1)*global.blood_font_scale;
			}
			posY1 = posY2 - string_height(word2)/2*global.blood_font_scale - string_height(word1)/2*global.blood_font_scale - random_range(0, 40);
			posX3 = posX2 + random_range(-string_width(word3)*global.blood_font_scale - 40, string_width(word2)*global.blood_font_scale + 40);
			//Adjust if 3rd word is out of bounds
			if posX3 < -x + 70 {
				posX3 = -x + 70;
			}
			if posX3 > leftOffset - string_width(word3)*global.blood_font_scale {
				posX3 = leftOffset - string_width(word3)*global.blood_font_scale;
			}
			posY3 = posY2 + string_height(word2)/2*global.blood_font_scale + string_height(word3)/2*global.blood_font_scale + random_range(0, 40);
			break;
		case 1:
			//Align based on the 2nd word
			posX2 = random_range(rightOffset, room_width - maxWidth - x);
			posY2 = random_range(bbox_top + totalHeight/2, bbox_bottom + totalHeight/3);
			posX1 = posX2 + random_range(-string_width(word1)*global.blood_font_scale - 40, string_width(word2)*global.blood_font_scale + 40);
			//Adjust if 1st word is out of bounds
			if posX1 > room_width - string_width(word1)*global.blood_font_scale - x {
				posX1 = room_width - string_width(word1)*global.blood_font_scale - x;
			}
			if posX1 < rightOffset {
				posX1 = rightOffset;
			}
			posY1 = posY2 - string_height(word2)/2*global.blood_font_scale - string_height(word1)/2*global.blood_font_scale - random_range(0, 40);
			posX3 = posX2 + random_range(-string_width(word3)*global.blood_font_scale - 40, string_width(word2)*global.blood_font_scale + 40);
			//Adjust if 3rd word is out of bounds
			if posX3 > room_width - string_width(word3)*global.blood_font_scale - x {
				posX3 = room_width - string_width(word3)*global.blood_font_scale - x;
			}
			if posX3 < rightOffset {
				posX3 = rightOffset;
			}
			posY3 = posY2 + string_height(word2)/2*global.blood_font_scale + string_height(word3)/2*global.blood_font_scale + random_range(0, 40);
			break;
		default:
			//Bottom is aligned based on the 2nd word, for which we allow a little bit of randomness
			posX2 = random_range(-string_width(word2)/2*global.blood_font_scale, string_width(word2)/2*global.blood_font_scale);
			posY2 = random_range(90, 120);
			//Check that 1st and 3rd word will not go out of bounds and adjust posX2
			if x + posX2 + string_width(word2)*global.blood_font_scale + string_width(word3)*global.blood_font_scale + 50 > room_width {
				posX2 = room_width - x - posX2 - string_width(word2)*global.blood_font_scale - string_width(word3)*global.blood_font_scale - 50;
			}
			if x + posX2 - string_width(word1)*global.blood_font_scale - 50 < 0 {
				posX2 = 0 - x - posX2 + string_width(word1)*global.blood_font_scale + 50;
			}
			posX1 = posX2 - string_width(word1)*global.blood_font_scale - random_range(10, 40);
			posX3 = posX2 + string_width(word2)*global.blood_font_scale + random_range(10, 40);
			posY1 = random_range(90, 120);
			posY3 = random_range(90, 120);
			break;
	}
}

function windowHints()
{
	draw_set_font(global.blood_font);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_text_transformed(x + posX1, y + posY1, word1, global.blood_font_scale, global.blood_font_scale, 0);
	draw_text_transformed(x + posX2, y + posY2, word2, global.blood_font_scale, global.blood_font_scale, 0);
	draw_text_transformed(x + posX3, y + posY3, word3, global.blood_font_scale, global.blood_font_scale, 0);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}