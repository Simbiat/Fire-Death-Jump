if instance_exists(obj_player) && obj_player.ghost {
	image_alpha = 1;
	if global.ghost_satiety > 100 {
		global.ghost_satiety = 100;
	}
	if global.ghost_timer >= 0 {
		if global.ghost_satiety == 100 {
			obj_player.ghost = false;	
			global.ghost_satiety = 0;
		} else {
			if global.ghost_satiety > 0 && alarm[0] < 0 {
				alarm[0] = room_speed;
			}
		}
	}
} else {
	image_alpha = 0;
}