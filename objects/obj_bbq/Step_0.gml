depth = -y - 1

//show_debug_message("Enemy HP: " + string(hp));

// if health <=0 room restart
global.BBQHP = hp
if (global.BBQHP <=0)
{
	global.Time = room_speed * 60 * 1;
	global.KnifeCount = 10;
	//room_restart();
	global.GameState = GameStates.GAMEOVER;
}

// quick time event to speed up the cooking process if successfull it increases your overall time
// if you fail you lose overall time.