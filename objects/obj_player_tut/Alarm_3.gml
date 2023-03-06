/// @description Stop movement
moving = false;
vspeed = 0;
gravity = -0;
sprite_index = sprite_hold_jump;
switch (obj_tutorial.page) {
    case 1:
        y = closed_window.y - (bbox_bottom - y);
        break;
	//Because at this point it is still page 2
	case 2:
        y = civilian_window_1.y - (bbox_bottom - y);
        break;
    default:
        // code here
        break;
}