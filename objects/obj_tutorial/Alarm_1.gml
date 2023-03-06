/// @description Destroy "from ghost" sequence
if obj_game.ghost_seq_from != noone {
	layer_sequence_destroy(obj_game.ghost_seq_from);
	obj_game.ghost_seq_from = noone;
}