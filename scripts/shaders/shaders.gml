function grayscale()
{
	if (instance_exists(obj_player) && obj_player.ghost) {
		shader_set(sha_grayscale);
	}
	draw_self();
	shader_reset();
}

function bloodShader()
{
	if (instance_exists(obj_player) && obj_player.ghost) {
		shader_set(sha_tone);
		switch hp {
			case 3:
				shader_set_uniform_f_array(shader_get_uniform(sha_tone, "u_lum"), [1.0, 0.827, 0.661, 1.0]);
				break;
			case 2:
				shader_set_uniform_f_array(shader_get_uniform(sha_tone, "u_lum"), [0.6, 0.678, 0.532, 1.0]);
				break;
			case 1:
				shader_set_uniform_f_array(shader_get_uniform(sha_tone, "u_lum"), [0.2, 0.556, 0.394, 1.0]);
				break;
			default:
				shader_set_uniform_f_array(shader_get_uniform(sha_tone, "u_lum"), [0.0, 0.456, 0.177, 1.0]);
				break;
		}
		//Blood color
		shader_set_uniform_f_array(shader_get_uniform(sha_tone, "u_tone"), [0.53, 0.03137, 0.03137]);
	}
	draw_self();
	shader_reset();
}