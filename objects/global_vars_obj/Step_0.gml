if(global.GameState == GameStates.RESTART)
{
	global.Time = room_speed * 60 * 1;
	obj_player.visible = true
	global.Coins = 0
	
	global.TimeStopDuration = 5;//how long you can use the ability
	global.TimeStopCoolDownDuration = 15; //time between using the ability again

	global.RecallKnivesCooldown = 10;
	global.IsRecallKnives = false;
	global.MaxKnives = 10;
	global.KnifeCount = global.MaxKnives;

	global.Coins = 0

	global.PlayerFace = "DOWN";
	global.BBQHP = 50;
	obj_bbq.hp = global.BBQHP
	global.StaticBBQHP = 10 * 50;
	global.HealthBarSubImage = 0;

	global.DilationFactor = 1;
	
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


