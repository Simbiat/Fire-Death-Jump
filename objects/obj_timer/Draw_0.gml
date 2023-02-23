// Draw the instance itself,
// change font and alignment,
// draw score,
// reset alignment
draw_self();

draw_set_font(fnt_score);

draw_set_halign(fa_right);
draw_set_valign(fa_middle);

// round() is used because
// the height score
// is a decimal value, but we
// need to display an integer,
// which is why we round it
if instance_exists(obj_player) && obj_player.ghost {
	text_outline(x - 50, y, string(global.ghost_timer) + "s", make_colour_rgb(136, 8, 8));
} else {
	draw_text(x, y, "");
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);