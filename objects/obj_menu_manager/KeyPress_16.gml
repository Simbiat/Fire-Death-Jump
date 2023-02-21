/// @description Switch characters
if instance_exists(obj_character_select_1) && instance_exists(obj_character_select_2) {
	if global.char == 0 {
		with (obj_character_select_2) {
			select();	
		}
	} else {
		with (obj_character_select_1) {
			select();	
		}
	}
}
