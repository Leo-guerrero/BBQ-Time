
if(global.Time > 0 && room==JasonsBedroom && global.GameState == GameStates.PLAY){
	global.Time--;
}

if global.Time <=0 {
	global.GameState = GameStates.GAMEOVER
}

if (keyboard_check_pressed(vk_f11)) {
    fullscreen = !fullscreen; // toggle
    window_set_fullscreen(fullscreen);
}