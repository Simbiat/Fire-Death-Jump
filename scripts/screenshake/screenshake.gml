function screenshake(time, magnitude, fade = 0.25, left = true, right = true, top = true, bottom = true) {
	obj_screenshake.shaking = true;
	obj_screenshake.time = time;
	obj_screenshake.magnitude = magnitude;
	obj_screenshake.fade = fade;
	obj_screenshake.left = left;
	obj_screenshake.right = right;
	obj_screenshake.top = top;
	obj_screenshake.bottom = bottom;
}