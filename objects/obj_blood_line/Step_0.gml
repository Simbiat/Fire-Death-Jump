if instance_exists(obj_player) && obj_player.ghost {
	if global.ghost_satiety > 100 {
		global.ghost_satiety = 100;
	}
	image_yscale = 0.75*global.ghost_satiety;
	if global.ghost_timer >= 0 {
		if global.ghost_satiety == 100 {
			fromGhost();
		} else {
			if global.ghost_satiety > 0 && alarm[0] < 0 {
				alarm[0] = room_speed;
			}
		}
	}
} else {
	image_yscale = 0;
}