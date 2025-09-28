depth = -y - 1

// if health <=0 room restart
global.BBQHP = hp
if (global.BBQHP <=0)
{
	global.Time = room_speed * 60 * 1;
	global.KnifeCount = 10;
	global.BBQHP = 50;
	room_restart();
}