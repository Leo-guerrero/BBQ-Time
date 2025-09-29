if(global.GameState == GameStates.RESTART)
{
	global.Time = room_speed * 60 * 1;
	global.KnifeCount = 10;	
	global.BBQHP = 50
	obj_bbq.hp = global.BBQHP
	
	global.GameState = GameStates.PLAY;
}

if(!audio_is_playing(main_theme) && room == JasonsBedroom){
	audio_play_sound(main_theme, 10, false);
}

if(global.Time > 0 && room==JasonsBedroom && global.GameState == GameStates.PLAY && !obj_shop.inShopMenu){
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