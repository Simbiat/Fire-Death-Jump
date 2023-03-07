if obj_tutorial.page == 2 && first_kill == false {
	first_kill = true;
	global.score_blood += random_range(4.5, 5.7);
	with other {
		killed = true;
		civilianDeath();
	}
}
if obj_tutorial.page == 13 && first_crunch == false {
	first_crunch = true;
	global.score_blood += random_range(0.2, 0.5);
	with other {
		hp -= 1;
		audio_play_sound(snd_civilian_feed, 0, 0);
		alarm[2] = 0.5*room_speed;
	}
}
if (obj_tutorial.page == 15 && second_crunch == false) || (obj_tutorial.page == 16 && third_crunch == false) {
	if obj_tutorial.page == 15 {
		second_crunch = true;
	} else {
		third_crunch = true;
	}
	with other {
		switch(sprite_index) {
			case spr_civilian_0:
				sprite_index = spr_civilian_scared_0;
				break;
			case spr_civilian_1:
				sprite_index = spr_civilian_scared_1;
				break;
			case spr_civilian_2:
				sprite_index = spr_civilian_scared_2;
				break;
			case spr_civilian_3:
				sprite_index = spr_civilian_scared_3;
			break;
		}
		hp -= 1;
		audio_play_sound(snd_civilian_feed, 0, 0);
		alarm[3] = room_speed;
		if obj_tutorial.page == 16 {
			eaten = true;
			civilianDeath();
		}
	}
	if obj_tutorial.page == 16 {
		fromGhost(true);
	}
}