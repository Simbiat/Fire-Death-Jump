/// @description Delay extra satiety
if instance_exists(obj_player) && obj_player.ghost {
	global.ghost_satiety += 7;
}