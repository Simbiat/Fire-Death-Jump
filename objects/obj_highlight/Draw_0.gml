gpu_set_blendmode(bm_add); // Set the blend mode to add

draw_rectangle_color(x, y, width, height, c_white, c_white, c_white, c_white, false);

gpu_set_blendmode(bm_normal); // Reset the blend mode to normal