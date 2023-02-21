/// @description Conditionally hide
if !instance_exists(obj_player) || obj_player.ghost {
	image_alpha = 0;
} else {
	image_alpha = 1;
}