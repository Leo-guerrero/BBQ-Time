
var total_seconds = floor(global.Time / room_speed);

var minutes = total_seconds div 60;
var seconds = total_seconds mod 60;

if (room == room_ryan)
{
	draw_text(32, 32, string(minutes) + ":" + string_format(seconds, 2, 0));
}
//draw_text(x,y + 10, global.Time);
