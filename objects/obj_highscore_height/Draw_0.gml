// Draw instance itself
shader_set(sha_tone);
shader_set_uniform_f_array(shader_get_uniform(sha_tone, "u_lum"), [0.6, 0.678, 0.532]);
//Blood color
shader_set_uniform_f_array(shader_get_uniform(sha_tone, "u_tone"), [0.53, 0.03137, 0.03137]);
draw_self();
shader_reset();

// Change font and alignment
draw_set_font(fnt_score);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw height highscore
// round() is used because the height highscore
// is a decimal value, but we need to display an integer,
// which is why we round it
// string() is used to convert it from a number into a text string
text_outline(x, y, "Highest: " + string(round(global.highscore_height))+"m", make_colour_rgb(136, 8, 8));

// Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);