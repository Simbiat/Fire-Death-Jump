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

// Draw blood highscore
// string() is used to convert the highscore from a number
// into a text string
text_outline(x, y, "Goriest:" + string(global.highscore_blood)+"l", make_colour_rgb(150, 8, 8));

// Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);