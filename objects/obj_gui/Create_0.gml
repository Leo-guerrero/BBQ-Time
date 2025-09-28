enum GameState { PLAY, PAUSE, GAMEOVER }

state = GameState.PLAY;

end_reason = "TIME'S UP"

rank = "S+"


// end episode from anywhere
function end_game(reason, r)
{
	end_reason = string(reason);
	rank = string(r);
	
	state = GameState.GAMEOVER;
	instance_deactivate_all(true) // keep this GUI alive
	audio_pause_all();
}