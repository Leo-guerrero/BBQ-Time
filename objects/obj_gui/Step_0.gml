// if user pressed escape and state is still going
if (keyboard_check_pressed(vk_escape) && state != GameState.GAMEOVER)
{
	if (state == GameState.PAUSE)
	{
		state = GameState.PLAY
		instance_activate_all();
		audio_resume_all();
	}
	else
	{
		state = GameState.PAUSE;
		instance_deactivate_all(true); // freeze everything except this ui
		audio_pause_all();
	}
}
		