image_yscale = 0.75*global.ghost_satiety;
if instance_exists(obj_player) && obj_player.ghost {
	image_alpha = 1;
} else {
	image_alpha = 0;
}