if(global.Time > 0){
	global.Time--;
}

if (keyboard_check_pressed(vk_f11)) {
    fullscreen = !fullscreen; // toggle
    window_set_fullscreen(fullscreen);
}