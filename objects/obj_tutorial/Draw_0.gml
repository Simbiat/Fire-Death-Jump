if darken {
	//By default center text horizontally and place text in 1st 4th of the screen vertically
	var center = room_width/2;
	var vertical = room_height/4
	//Set font settings
	draw_set_font(fnt_score);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	//Highlight area and draw text
	switch (page) {
	    case 1:
	        areaFocus(obj_player_tut.x - obj_player_tut.sprite_width/2, obj_player_tut.y - obj_player_tut.sprite_height/2, obj_player_tut.x + obj_player_tut.sprite_width/2, obj_player_tut.y + obj_player_tut.sprite_height/2);
	        text_outline(center, vertical, "You are Jiangshi, a jumping vampire so common in Chinese folklore. You have no idea what sorcery has brought you to life, but you do not care, since you do not really have a concious. You are moved by instincts, and those are mostly about blood. Luckily for you there is a burning building nearby, so it should be easy to prey on some humans.", c_white, c_black);
			break;
		case 2:
	        areaFocus(civilian_window_1.x - civilian_window_1.sprite_width/2, civilian_window_1.y - civilian_window_1.sprite_height*0.75, civilian_window_1.x + civilian_window_1.sprite_width/2, civilian_window_1.y + civilian_window_1.sprite_height*0.1);
	        text_outline(center, vertical + 650, "Ha! Here's your first victim!\nBut you don't really feel hungry just yet...\nHm, might as well spill as much of blood as possible, since the smell of it is also quite pleasant.\nLet's jump onto that window! Since you are a jumping vampire you do not really need to do anything special for this. It's almost \"automatic\" for you.", c_white, c_black);
			break;
		case 3:
	        areaFocus(civilian_window_1.x - civilian_window_1.sprite_width/2, civilian_window_1.y - civilian_window_1.sprite_height*0.75, civilian_window_1.x + civilian_window_1.sprite_width/2, civilian_window_1.y + civilian_window_1.sprite_height*0.1);
	        text_outline(center, vertical, "Such prestine bouquet! Behind the iron smell of hemoglobin you notice almost floral-like notes, indicating that this human had a diverse and balanced diet. You are extatic!", c_white, c_black);
			break;
		case 4:
	        areaFocus(obj_score_blood.x - obj_score_blood.sprite_width/2, obj_score_blood.y - obj_score_blood.sprite_height/2 - 5, obj_score_blood.x + obj_score_blood.sprite_width/2 + 130, obj_score_blood.y + obj_score_blood.sprite_height/2 + 5);
	        text_outline(center, obj_score_blood.y + obj_score_blood.sprite_height/2 + 120, "While you're at it, why not count the amount of blood spilled? It may be worth mentioning it during some royal banquet with other vampires. You know, as if \"by accident\".", c_white, c_black);
			break;
		case 5:
	        areaFocus(fire_window_1.x - fire_window_1.sprite_width/2, fire_window_1.y - fire_window_1.sprite_height*0.75, fire_window_1.x + fire_window_1.sprite_width/2, fire_window_1.y + fire_window_1.sprite_height*0.1);
	        text_outline(center, vertical + 300, "Let's continue upward.", c_white, c_black);
			break;
		case 6:
	        areaFocus(fire_window_1.x - fire_window_1.sprite_width/2, fire_window_1.y - fire_window_1.sprite_height*0.75, fire_window_1.x + fire_window_1.sprite_width/2, fire_window_1.y + fire_window_1.sprite_height*0.1);
	        text_outline(center, vertical, "That hurt a lot! As a Jiangshi you do not really like touching fire. Although, you doubt that there are many creatures that do.", c_white, c_black);
			break;
		case 7:
	        areaFocus(obj_score_height.x - obj_score_height.sprite_width/2 - 5, obj_score_height.y + obj_score_height.sprite_height - 30, obj_score_height.x + obj_score_height.sprite_width/2 + 5, obj_score_height.y + obj_score_height.sprite_height*2 - 10);
	        text_outline(center, obj_score_height.y + obj_score_height.sprite_height*2 - 10 + 100, "You feel like your strength reduced signifficantly and estimate that 5 more hits like this (that is 6 in total) would probably be the permanent death of you.", c_white, c_black);
			break;
		case 8:
	        areaFocus(obj_timer.x - obj_timer.sprite_width - 30, obj_timer.y - obj_timer.sprite_height/2, obj_timer.x + obj_timer.sprite_width/2, obj_timer.y + obj_timer.sprite_height/2);
	        text_outline(center, vertical + 200, "What's worse you feel your veins and arteries pulsing, as if a rooster pecking away at seeds. And Jiangshi do not like roosters for sure.\nIt is like a countdown within which you need to do something, and if it reaches 0 - you won't be able to do anything ever again. But what is it, that you need to do?", c_white, c_black);
			break;
		case 9:
	        areaFocus(obj_blood_line.x - obj_blood_line.sprite_width/2 - 40, obj_blood_line.y - 200, obj_blood_line.x + obj_blood_line.sprite_width/2 + 40, obj_blood_line.y + 100);
	        text_outline(center, vertical + 200, "You are also hungry. Perhaps getting enough blood (and fast) can help you recover? You do feel somewhat empty, and your stomach is like a crumped up empty blood bag. You need to find more humans.", c_white, c_black);
			break;
		case 10:
	        areaFocus(fire_window_2.x - fire_window_2.sprite_width/2, fire_window_2.y - fire_window_2.sprite_height*0.75, fire_window_2.x + fire_window_2.sprite_width/2, fire_window_2.y + fire_window_2.sprite_height*0.1);
	        text_outline(center, vertical + 350, "The next window has fire as well, but it looks... Slower? Even if weakened, you think you should be able to move around the flames fast enough.", c_white, c_black);
			break;
		case 11:
	        areaFocus(0, room_height - 200, room_width, room_height);
	        text_outline(center, room_height - 350, "The fire below you seems much more fierce, so your instincts tell you it may be a bad idea to fall into it still. If you want to avoid true death, that is.", c_white, c_black, 4, room_width - 300);
			break;
		case 12:
	        areaFocus(civilian_window_2.x - civilian_window_2.sprite_width/2, civilian_window_2.y - civilian_window_2.sprite_height*0.75, civilian_window_2.x + civilian_window_2.sprite_width/2, civilian_window_2.y + civilian_window_2.sprite_height*0.1);
	        text_outline(center, vertical + 300, "There! Another human! You practically see all its blood vesels. Let's eat!", c_white, c_black);
			break;
		case 13:
	        areaFocus(obj_blood_line.x - obj_blood_line.sprite_width/2 - 40, obj_score_blood.y - obj_score_blood.sprite_height/2 - 5, obj_score_blood.x + obj_score_blood.sprite_width/2 + 130, obj_blood_line.y + 100);
	        text_outline(center, vertical + 150, "Your swing is not strong to kill a human now, but you are able to get some blood to lick from the claws. It's not enough to fully recover, especially since some of it spilled.", c_white, c_black);
			break;
		case 14:
	        areaFocus(civilian_window_2.x - civilian_window_2.sprite_width/2, civilian_window_2.y - civilian_window_2.sprite_height*0.75, civilian_window_2.x + civilian_window_2.sprite_width/2, civilian_window_2.y + civilian_window_2.sprite_height*0.1);
	        text_outline(center, vertical + 870, "You have a feeling, that you need to hold yourself... down. You almost see this mental vision of a big button with an arrow pointing downwards on it.\nYou pull all your will to hold down your instincts to jump...", c_white, c_black);
			break;
		case 15:
	        areaFocus(obj_blood_line.x - obj_blood_line.sprite_width/2 - 40, obj_score_blood.y - obj_score_blood.sprite_height/2 - 5, obj_score_blood.x + obj_score_blood.sprite_width/2 + 130, obj_blood_line.y + 100);
	        text_outline(center, vertical + 150, "Now this is more like it! More blood has filled your stomach, which means that this method will allow you to recover faster.", c_white, c_black);
			break;
		case 16:
	        areaFocus(obj_player_tut.x - obj_player_tut.sprite_width/2, obj_player_tut.y - obj_player_tut.sprite_height/2, obj_player_tut.x + obj_player_tut.sprite_width/2, obj_player_tut.y + obj_player_tut.sprite_height/2);
	        text_outline(center, vertical, "Once recovered the only thing you can do is move upwards.\nLooking at how the fire is spreading, the higher you go the more dangerous it will become, but you also smell more fear from up above, which means more humans.", c_white, c_black);
			break;
		case 17:
	        areaFocus(obj_score_height.x - obj_score_height.sprite_width/2 - 130, obj_score_height.y - obj_score_height.sprite_height/2 - 5, obj_score_height.x + obj_player_tut.sprite_width/2, obj_score_height.y + obj_score_height.sprite_height/2 + 5);
	        text_outline(center, obj_score_height.y + obj_score_height.sprite_height/2 + 120, "And since you are goind upward, why not count the height you climbed up? Remember, it may become quite important during the next vampire banquet.", c_white, c_black);
			break;
		case 18:
	        areaFocus(obj_player_tut.x - obj_player_tut.sprite_width/2, obj_player_tut.y - obj_player_tut.sprite_height/2, obj_player_tut.x + obj_player_tut.sprite_width/2, obj_player_tut.y + obj_player_tut.sprite_height/2);
	        text_outline(center, vertical, "What are you waiting for? Up, up and away!", c_white, c_black);
			break;
	    default:
	        // code here
	        break;
	}
	//Reset text alignment settings
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
} else {
	//Required to reset the text
	draw_text(x, y, "");
}