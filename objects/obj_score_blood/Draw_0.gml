// Draw the instance itself,
// change font and alignment,
// draw score,
// reset alignment
draw_self();

draw_set_font(fnt_score);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);

//draw_text(x, y, "Blood " + string(global.score_blood));
text_outline(x + 50, y, string(global.score_blood) + "l", make_colour_rgb(136, 8, 8));

draw_set_halign(fa_left);
draw_set_valign(fa_top);