var lay_id = layer_get_id("Background");
layer_script_begin(lay_id, bg_start_script_tut);
layer_script_end(lay_id, bg_end_script);
// Stop the menu music
audio_stop_sound(snd_menu_music);
//Start intro sequence
layer_sequence_create("HUD", 0, 0, seq_tutorial_start);