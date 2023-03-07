// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pageLoad(nextPage)
{
	instance_destroy(obj_next);
	with (obj_tutorial) {
		darken = false;
		switch (nextPage) {
		    case 1:
		        alarm[2] = 2.25*room_speed;
		        break;
			case 3:
				//Move the player up by 1 window
				with (obj_player_tut) {
					alarm[2] = 1;
					alarm[3] = 18;
				}
				alarm[2] = 2*room_speed;
		        break;
			case 6:
				//Move the player up by 1 window
				with (obj_player_tut) {
					alarm[2] = 1;
					alarm[3] = 18;
				}
				alarm[2] = 2*room_speed;
		        break;
			case 12:
				//Move the player up by 1 window
				with (obj_player_tut) {
					alarm[2] = 1;
					alarm[3] = 18;
				}
				alarm[2] = 0.75*room_speed;
		        break;
			case 13:
				//Move the player up by 1 window
				with (obj_player_tut) {
					alarm[2] = 1;
					alarm[3] = 18;
				}
				alarm[2] = 1*room_speed;
		        break;
			case 15:
				obj_player_tut.sprite_index = obj_player_tut.sprite_attack;
		        alarm[2] = room_speed;
		        break;
			case 16:
		        obj_player_tut.sprite_index = obj_player_tut.sprite_attack;
		        alarm[2] = room_speed;
		        break;
			case 19:
				//Move the player up by 2 window
				with (obj_player_tut) {
					alarm[2] = 1;
					alarm[3] = room_speed;
				}
				alarm[3] = room_speed;
				break;
		    default:
		        alarm[2] = 1;
		        break;
		}
	}
}