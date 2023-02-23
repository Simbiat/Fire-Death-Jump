// Make the player jump and enable gravity
vspeed = -35;
gravity = 0.8;

// Initialize the player's blood and height scores as global variables
global.score_blood = 0;
global.score_height = 0;
global.ghost_timer = 0;
global.ghost_satiety = 0;

// Horizontal movement speed
// Used by events for Left, Right, A & D keys
// Left & A are the same, and
// Right & D are the same
move_speed = 12;

// Target position on x axis where this instance needs to move
// Used to smoothen horizontal movement
target_x = x;

// Whether the player is currently wrapping the screen horizontally
wrapping = false;

// How much margin the player has (horizontally, from the center) to wrap on the sides of the screen
wrap_margin = 70;

// Start with the "in-air" sprite
sprite_index = sprite_air;

// Touch input for the X axis (relative variable, default 0)
touch_input_x = 0;

function toGhost(fire = true)
{
	if !ghost {
		if deaths > 5 {
			//Perma death
			instance_create_layer(x, y, "Player", obj_player_defeated);
			audio_play_sound(snd_player_defeat_fire, 0, 0);
			instance_destroy();
		} else {
			deaths += 1;
			ghost = true;
			global.ghost_satiety = 10;
			global.ghost_timer = 150 - deaths * 30;
			// Play sound for when fire defeats the player
			if fire {
				audio_play_sound(snd_player_defeat_fire, 0, 0);
			} else {
				audio_play_sound(snd_player_defeat_bottom, 0, 0);
			}
		}
	}
}