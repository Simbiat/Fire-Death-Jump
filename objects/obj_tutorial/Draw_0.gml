if darken {
	draw_set_alpha(0.75);
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, room_height, false);
	//Highlight object
	draw_set_color(c_white);
	switch (page) {
	    case 1:
	        draw_rectangle(200, 200, 300, 300, false);
	        break;
	    default:
	        // code here
	        break;
	}
	draw_set_alpha(1);
	draw_surface(dark_mask, 0, 0);
}