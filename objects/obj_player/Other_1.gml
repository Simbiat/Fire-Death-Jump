// If the player is on the bottom boundary
// of the room, defeat it
if (y >= room_height)
{
	//Align with the bottom
	y = room_height - (bbox_bottom - y);
	//Change sprite
	sprite_index = sprite_jump;
	image_index = 0;
	// Stop player until Animation End
	vspeed = 0;
	// Disable gravity so the player stays stopped
	gravity = 0;
	toGhost(false);
}