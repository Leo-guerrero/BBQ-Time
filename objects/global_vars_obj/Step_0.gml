
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

//respawn Player

if(global.PlayerRespawnDelay > 0){
	global.PlayerRespawnDelay--;
}

if(!instance_exists(obj_player) && room == JasonsBedroom && global.PlayerRespawnDelay <= 0){
	global.CurrentPlayerHP = 100;
	instance_create_depth(767,322,-999,obj_player);
}