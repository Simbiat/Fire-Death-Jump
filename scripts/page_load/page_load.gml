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
			case 2:
		        alarm[2] = 1;
		        break;
			case 3:
				//Move the player up by 1 window
				with (obj_player_tut) {
					alarm[2] = 1;
					alarm[3] = 18;
				}
				alarm[2] = 2*room_speed;
		        break;
			case 4:
		        alarm[2] = 1;
		        break;
		    default:
		        alarm[2] = 0.25*room_speed;
		        break;
		}
	}
}