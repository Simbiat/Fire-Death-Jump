// If the fire's alpha is <0 which means it's fading away
// then the player should not collide with it
// In that case we exit the event so the rest of the code doesn't run
if (other.image_alpha < 1)
{
	exit;
}

if ghost {
	if !invulnerable {
		permaDeath();
	}
} else {
	toGhost();
	//Set temporary invulnerability to prevent instant death
	invulnerable = true;
	//Set it for 3 seconds. 2 should be enough, but let's have a bit of a margin
	alarm[1] = 3*room_speed;
}
