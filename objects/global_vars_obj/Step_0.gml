
if(global.Time > 0 && room==room_ryan && !global.game_paused){
	global.Time--;
}


if (keyboard_check_pressed(vk_f11)) {
    fullscreen = !fullscreen; // toggle
    window_set_fullscreen(fullscreen);
}