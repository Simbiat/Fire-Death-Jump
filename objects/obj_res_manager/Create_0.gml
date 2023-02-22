// Set game width, height and scale
var width = 1080, height = 1920, scale = min(1, display_get_height() / 1920);

// Set window size and surface resolution
window_set_size(width*scale, height*scale);
surface_resize(application_surface, width*scale, height*scale);

// Move window to center of display
window_set_position(display_get_width()/2-(width*scale)/2, display_get_height()/2-(height*scale)/2);

// Set correct size for GUI layer
display_set_gui_size(width*scale, height*scale);

// By default, each time you run the game,
// random functions return the same results.
// This is done for easier testing, but
// when you actually build an executable
// of your game, seeds are randomized so 
// each play is unique.
// We use this Randomize action to randomize
// the seed even when we're just testing the
// game so we can get unique experiences.
randomize();

// Initialize global highscore variables
global.highscore_blood = 0;
global.highscore_height = 0;

// This is the ID of the character that is
// selected (0 or 1)
global.char = 0;