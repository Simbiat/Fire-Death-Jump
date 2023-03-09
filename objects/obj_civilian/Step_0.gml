if (instance_exists(obj_player) && obj_player.ghost) {
	image_speed = 0.25;
} else {
	image_speed = 1;
}

// Destroy if below room (350-pixel margin)
if (y > room_height + 350 || y < - 350)
{
	instance_destroy();
}