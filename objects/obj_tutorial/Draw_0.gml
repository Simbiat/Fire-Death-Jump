if darken {
	//Highlight area
	switch (page) {
	    case 1:
	        areaFocus(obj_player_tut.x - obj_player_tut.sprite_width/2, obj_player_tut.y - obj_player_tut.sprite_height/2, obj_player_tut.x + obj_player_tut.sprite_width/2, obj_player_tut.y + obj_player_tut.sprite_height/2);
	        break;
		case 2:
	        areaFocus(civilian_window_1.x - civilian_window_1.sprite_width/2, civilian_window_1.y - civilian_window_1.sprite_height*0.75, civilian_window_1.x + civilian_window_1.sprite_width/2, civilian_window_1.y + civilian_window_1.sprite_height*0.1);
	        break;
		case 3:
	        areaFocus(civilian_window_1.x - civilian_window_1.sprite_width/2, civilian_window_1.y - civilian_window_1.sprite_height*0.75, civilian_window_1.x + civilian_window_1.sprite_width/2, civilian_window_1.y + civilian_window_1.sprite_height*0.1);
	        break;
		case 4:
	        areaFocus(obj_score_blood.x - obj_score_blood.sprite_width/2, obj_score_blood.y - obj_score_blood.sprite_height/2 - 5, obj_score_blood.x + obj_score_blood.sprite_width/2 + 130, obj_score_blood.y + obj_score_blood.sprite_height/2 + 5);
	        break;
	    default:
	        // code here
	        break;
	}
	//Draw text
	draw_set_font(fnt_score);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	//By default center horizontally and place text in 1st 4th of the screen vertically
	var center = room_width/2;
	var vertical = room_height/4
	switch (page) {
	    case 1:
	        text_outline(center, vertical, "You are Jiangshi, a jumping vampire so common in Chinese folklore. You have no idea what sorcery has brought you to life, but you do not care, since you do not really have a concious. You are moved by instincts, and those are mostly about blood. Luckily for you there is a burning building nearby, so it should be easy to prey on some humans.", c_white, c_black);
			break;
		case 2:
	        text_outline(center, vertical + 650, "Ha! Here's your first victim!\nBut you don't really feel hungry just yet...\nHm, might as well spill as much of blood as possible, since the smell of it is also quite pleasant.\nLet's jump onto that window! Since you are a jumping vampire you do not really need to do anything special for this. It's almost \"automatic\" for you.", c_white, c_black);
			break;
		case 3:
	        text_outline(center, vertical, "Such prestine bouquet! Behind the iron smell of hemoglobin you notice almost floral-like notes, indicating that this human had a diverse and balanced diet. You are extatic!", c_white, c_black);
			break;
		case 4:
	        text_outline(center, vertical, "While you're at it, why not count the amount of blood spilled? It may be worth mentioning it during some royal banquet with other vampires. You know, as if \"by accident\".", c_white, c_black);
			break;
	    default:
	        text_outline(center, vertical, "The rest of the tutorial is currently under construction.", c_white, c_black);
	        break;
	}
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
} else {
	//Required to reset the text
	draw_text(x, y, "");
}