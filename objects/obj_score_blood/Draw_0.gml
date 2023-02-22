// Draw the instance itself,
// change font and alignment,
// draw score,
// reset alignment
draw_self();

draw_set_font(fnt_score);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x, y, "Blood " + string(global.score_blood));

draw_set_halign(fa_left);
draw_set_valign(fa_top);