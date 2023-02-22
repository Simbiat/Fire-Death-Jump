// Draw the instance itself,
// change font and alignment,
// draw score,
// reset alignment
draw_self();

draw_set_font(fnt_score);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// round() is used because
// the height score
// is a decimal value, but we
// need to display an integer,
// which is why we round it
if instance_exists(obj_player) && obj_player.ghost {
	draw_text(x, y, "Satiety " + string(round(global.ghost_satiety)) + "/100");
} else {
	draw_text(x, y, "");
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);