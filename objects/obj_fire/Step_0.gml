// Destroy if below room (200-pixel margin)
if (y > room_height + 200)
{
	instance_destroy();
}
if instance_exists(obj_player) && obj_player.ghost {
	sprite_index = spr_fire_particle;
} else {
	sprite_index = spr_fire;
}