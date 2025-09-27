
show_debug_message("Enemy HP: " + string(hp));

// if health <=0 room restart
if (hp <=0)
{
	room_restart();
}