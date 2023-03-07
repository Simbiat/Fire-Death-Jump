if (instance_exists(obj_player) && obj_player.ghost) || (instance_exists(obj_player_tut) && obj_player_tut.ghost) {
	if global.ghost_timer > 0 {
		if alarm[0] < 0 {
			alarm[0] = room_speed;
		}
	} else {
		permaDeath();
	}
}