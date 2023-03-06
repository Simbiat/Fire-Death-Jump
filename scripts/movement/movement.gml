//Function to move the screen down
function move_screen()
{
	if (y < room_height / 2) {
		// And if the player is going upwards
		if (vspeed < 0) {
			// Flip its vspeed to create a downward speed
			var downspeed = -vspeed;
	
			// Apply to all children of obj_move_parent
			with (obj_move_parent) {
				y += downspeed;
			}
	
			// Stick the player to the center of the screen, vertically
			y = room_height / 2;
	
			// Get the Background layer's Y position
			var back_y = layer_get_y("Background");
	
			// Move the background along with the other instances
			layer_y("Background", back_y + downspeed);
	
			// Add to the height score
			global.score_height += downspeed / 100;
		}
	}
}

function jump()
{
	sprite_index = sprite_jump_to_air;
	image_index = 0;

	vspeed = -35;

	// Resume gravity
	gravity = 1;

	// Select random jump sound from the 3 that are in the
	// assets
	var shoot_sound = choose(snd_player_jump_1, snd_player_jump_2, snd_player_jump_3);

	// Play that sound
	audio_play_sound(shoot_sound, 10, 0);

	// Create jump effect at 0, bbox_bottom
	// bbox_bottom is the bottom edge of the
	// instance's mask
	instance_create_layer(x, bbox_bottom, "Player", obj_jump_effect);
}

function landOnWindow()
{
	// If the player is falling down, switch to the jump animation
	// Once that animation ends, the player jumps (see the Animation End event)
	if (vspeed > 0)
	{
		sprite_index = sprite_jump;
		image_index = 0;

		// Stop player until Animation End
		vspeed = 0;

		// Disable gravity so the player stays stopped
		gravity = 0;

		// Position player relative to window
		// so no matter where the collision happens
		// vertically it's always in the correct
		// position for the jump animation
		y = other.y - (bbox_bottom - y);
	}
}