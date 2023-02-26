/// @description Stop eating
if instance_exists(obj_corn_seed) {
	instance_destroy(obj_corn_seed);	
}
image_angle = -30;
eating = false;
alarm[0] = 0.5*room_speed;