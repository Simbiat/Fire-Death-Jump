if instance_exists(obj_player) && obj_player.ghost {
	image_alpha = 1;
	if global.ghost_timer > 0 {
		if alarm[0] < 0 {
			alarm[0] = room_speed;
		}
	} else {
		instance_create_layer(obj_player.x, obj_player.y, "Player", obj_player_defeated);
		instance_destroy(obj_player);
	}
} else {
	image_alpha = 0;
}