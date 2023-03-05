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
	if moving {
	toGhost();
	//Set temporary invulnerability to prevent instant death
	invulnerable = true;
	//Set it for 2 seconds
	alarm[1] = 2*room_speed;
	}
}
