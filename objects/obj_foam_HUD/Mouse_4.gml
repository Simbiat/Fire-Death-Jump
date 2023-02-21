/// @description Fire foam
if collision_point(mouse_x, mouse_y, id, true, false) {
	if instance_exists(obj_player) {
		event_perform_object(obj_player, ev_left_press, 0);
	}
}