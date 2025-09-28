if(global.GameState == GameStates.RESTART)
{
	global.Time = room_speed * 60 * 1;
	global.KnifeCount = 10;	
	global.BBQHP = 50
	obj_bbq.hp = global.BBQHP
	
	global.GameState = GameStates.PLAY;
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