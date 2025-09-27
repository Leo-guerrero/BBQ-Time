depth = -y - 1
show_debug_message("Enemy HP: " + string(hp));

// if health <=0 room restart
if (global.BBQHP <=0)
{
	global.Time = room_speed * 60 * 1;
	global.KnifeCount = 10;
	global.BBQHP = 50;
	room_restart();
}