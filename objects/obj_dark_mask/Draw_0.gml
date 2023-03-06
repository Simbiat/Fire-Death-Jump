draw_set_alpha(image_alpha); // Set the transparency of the drawing

gpu_set_blendmode(bm_add); // Set the blend mode to subtract

draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false); // Draw the black rectangle

gpu_set_blendmode(bm_normal); // Reset the blend mode to normal