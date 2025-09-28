
if(keyboard_check_pressed(vk_space))
{
	global.playerTimerScore--;
	Save_Game();
}
else if(vk_return)
{
	Load_Game();
}