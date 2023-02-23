if instance_exists(obj_player) && obj_player.deaths > 0 && obj_player.deaths >= iconNumber {
	image_alpha = 1;
} else {
	image_alpha = 0;
}