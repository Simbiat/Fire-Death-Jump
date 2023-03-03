if image_yscale > 0 {
	draw_set_font(fnt_score);

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	text_outline(x, y-250, "NO MORE", make_colour_rgb(136, 8, 8));
	text_outline(x, y-200, "SECOND CHANCES!", make_colour_rgb(136, 8, 8));

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}