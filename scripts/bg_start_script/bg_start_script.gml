// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bg_start_script(){
	if event_type == ev_draw {
        if event_number == ev_draw_normal {
			if instance_exists(obj_player) && obj_player.ghost {
				shader_set(sha_grayscale);
			}
		}
	}
}