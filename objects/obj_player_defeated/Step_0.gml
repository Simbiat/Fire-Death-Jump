// When this instance is below the room, create the game over sequence
// so the player can choose to replay or go back to menu.
if (y > room_height + 50) {
	// Also destroy this instance to make sure this code doesn't run again.
	instance_destroy();
}