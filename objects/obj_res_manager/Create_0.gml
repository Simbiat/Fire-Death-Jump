// Set game width, height and scale
var width = 1080, height = 1920;
global.screen_scale = min(1, display_get_height() / height, display_get_width() / width)

// Set window size and surface resolution
window_set_size(width*global.screen_scale, height*global.screen_scale);
surface_resize(application_surface, width*global.screen_scale, height*global.screen_scale);

// Move window to center of display
window_set_position(display_get_width()/2-(width*global.screen_scale)/2, display_get_height()/2-(height*global.screen_scale)/2);

// Set correct size for GUI layer
display_set_gui_size(width*global.screen_scale, height*global.screen_scale);

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
//And those for hints
global.first_civilian = true;
global.first_fire = true;
//Those for fonts
global.blood_font = font_add_sprite_ext(spr_blood_font, "0123456789abcdefghijklmnopqrstuvwxyz", true, 1);
global.blood_font_scale = 0.5;
global.font_line_sep = 50;