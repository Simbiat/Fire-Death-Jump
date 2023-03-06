// If the jump animation ended, make the player
// jump, and start transition to in-air animation
if (sprite_index == sprite_jump || sprite_index = sprite_hold_jump)
{
	if !isHoldingDown() && moving {
		jump();
	} else {
		if sprite_index != sprite_hold_jump {
			sprite_index = sprite_hold_jump;
		}
	}
}
// If the jump to air transition animation
// ended, switch to in-air sprite
else if (sprite_index == sprite_jump_to_air)
{
	sprite_index = sprite_air;
	image_index = 0;
}
// If the air to fall transition animation
// ended, switch to fall sprite
else if (sprite_index == sprite_air_to_fall)
{
	sprite_index = sprite_fall;
	image_index = 0;
}