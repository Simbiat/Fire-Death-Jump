// Play the game music
audio_play_sound(snd_tutorial, 0, 1);

// Create transition "end" sequence which ends
// the transition, because the game has started
layer_sequence_create("Transition", 0, 0, seq_transition_end);

//Create array for death sequences' ids
death_seqs = [noone, noone, noone, noone, noone];

//Update windows
with (civilian_window_1) {
	createCivilian();
}
with (fire_window_1) {
	createFire();
}
with (fire_window_2) {
	createFire();
}

//Start 1st page
pageLoad(page+1);