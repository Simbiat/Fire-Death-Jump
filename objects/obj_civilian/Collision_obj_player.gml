// If civilian is not killed yet
if (killed == false && eaten == false) {
	if obj_player.ghost {
		if obj_player.vspeed == 0 {
			if hp > 0 {
				if alarm[2] < 0 {
					hp -= 1;
					//Add a little bit of blood if we are not holding down
					if !isHoldingDown() {
						global.score_blood += random_range(0.2, 0.5);
					}
					if hp == 0 {
						//Synchronize with the "death" alarm
						alarm[2] = 4;
					} else {
						alarm[2] = 0.75*room_speed;
					}
				}
			} else {
				// Play kill sound
				audio_play_sound(snd_civilian_rescue, 0, 0);
				// Set eaten to true
				eaten = true;
			}
		}
	} else {
		// Play kill sound
		audio_play_sound(snd_civilian_rescue, 0, 0);
		// Increase blood score
		global.score_blood += random_range(4.5, 5.7);
		// Set killed to true
		killed = true;
	}

	if killed || eaten {
		// Change sprite to transition sprite depending on current sprite
		switch(sprite_index) {
			case spr_civilian_0:
				sprite_index = spr_civilian_transition_0;
			break;
	
			case spr_civilian_1:
				sprite_index = spr_civilian_transition_1;
			break;
	
			case spr_civilian_2:
				sprite_index = spr_civilian_transition_2;
			break;
		}

		// Set alarm to end transition and make civilian jump
		alarm[0] = 4;
	}
}