/// @param xx X for the text
/// @param yy Y for the text
/// @param textToDraw Text
/// @param textColor Text color
/// @param outlineColor Outline color
/// @param outlineThickness Outline thickness
function text_outline(xx, yy, textToDraw, textColor = c_white, outlineColor = c_black, outlineThickness = 4, maxWidth = 0)
{
	if maxWidth <= 0 {
		maxWidth = room_width - outlineThickness;
	} else {
		maxWidth -= outlineThickness;
	}
	// Draw the text with an outline
	draw_set_color(outlineColor);
	draw_text_ext(xx - outlineThickness, yy, textToDraw, global.font_line_sep, maxWidth);
	draw_text_ext(xx + outlineThickness, yy, textToDraw, global.font_line_sep, maxWidth);
	draw_text_ext(xx, yy - outlineThickness, textToDraw, global.font_line_sep, maxWidth);
	draw_text_ext(xx, yy + outlineThickness, textToDraw, global.font_line_sep, maxWidth);
	draw_set_color(textColor);
	draw_text_ext(xx, yy, textToDraw, global.font_line_sep, maxWidth);
	//Reset color to default
	draw_set_color(c_white);
}