depth = -y - 1


//show_debug_message("Enemy HP: " + string(hp));

// if health <=0 room restart\
if (global.GameState ==GameStates.PLAY){
	global.BBQHP = hp
}
if (global.BBQHP <=0)
{
	global.GameState = GameStates.GAMEOVER;
}
