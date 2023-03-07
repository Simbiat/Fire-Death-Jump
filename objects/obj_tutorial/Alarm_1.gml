/// @description Destroy "from ghost" sequence
if ghost_seq_from != noone {
	layer_sequence_destroy(ghost_seq_from);
	ghost_seq_from = noone;
}