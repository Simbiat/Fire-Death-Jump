/// @description Count down
global.ghost_timer -= 1;
//Create seed
if !instance_exists(obj_corn_seed) {
	instance_create_layer(bbox_left - 20, bbox_bottom - 20, "HUD", obj_corn_seed);
}
