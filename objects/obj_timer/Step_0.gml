if instance_exists(obj_player) && obj_player.ghost {
	image_alpha = 1;
	if global.ghost_timer > 0 {
		if alarm[0] < 0 {
			alarm[0] = room_speed;
		}
	} else {
		permaDeath();
	}
} else {
	image_alpha = 0;
}