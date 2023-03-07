// This event handles moving everything down so it looks like the player is moving up.
// Please refer to Part 1 of the tutorial for detailed information.
// If the player is in the upper half of the room
if moving && obj_tutorial.page < 18 {
	move_screen();
}
//Prevent reduction of the timer
global.ghost_timer = 60;
//Prevent reduction of the satiety
if  obj_tutorial.page == 13 or obj_tutorial.page == 14 {
	global.ghost_satiety = 16;
} else if obj_tutorial.page == 15 {
	global.ghost_satiety = 26;
} else if obj_tutorial.page == 16 {
	global.ghost_satiety = 36;	
} else {
	global.ghost_satiety = 10;
}