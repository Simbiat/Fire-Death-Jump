function text_outline(xx, yy, textToDraw, textColor = c_white, outlineColor = c_black, outlineThickness = 4)
{
	// Draw the text with an outline
	draw_set_color(outlineColor);
	draw_text(xx - outlineThickness, yy, textToDraw);
	draw_text(xx + outlineThickness, yy, textToDraw);
	draw_text(xx, yy - outlineThickness, textToDraw);
	draw_text(xx, yy + outlineThickness, textToDraw);
	draw_set_color(textColor);
	draw_text(xx, yy, textToDraw);
	//Reset color to default
	draw_set_color(c_white);
}