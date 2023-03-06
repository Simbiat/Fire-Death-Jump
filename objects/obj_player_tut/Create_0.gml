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
//target_x = x;
target_x = 544;

// Start with the "in-air" sprite
sprite_index = sprite_air;

// Touch input for the X axis (relative variable, default 0)
touch_input_x = 0;

alarm[2] = room_speed;
alarm[3] = 2.25*room_speed;