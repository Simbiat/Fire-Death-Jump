/// @description Heat effect
if instance_exists(obj_player) && obj_player.ghost {
	shader_set(sha_heat);
	shader_set_uniform_f(shader_get_uniform(sha_heat, "time"), current_time);
	draw_surface(application_surface, 0,0);
	shader_reset();
}