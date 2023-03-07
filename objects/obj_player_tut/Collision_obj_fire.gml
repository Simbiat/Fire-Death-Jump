// If the fire's alpha is <0 which means it's fading away
// then the player should not collide with it
// In that case we exit the event so the rest of the code doesn't run
if (other.image_alpha < 1)
{
	exit;
}
if !ghost {
	toGhost(true);
}