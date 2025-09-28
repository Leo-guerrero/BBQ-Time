
var total_seconds = floor(global.Time / room_speed);

var minutes = total_seconds div 60;
var seconds = total_seconds mod 60;

if (room == JasonsBedroom)
{
	draw_text(32, 32, string(minutes) + ":" + string_format(seconds, 2, 0));
}
//draw_text(x,y + 10, global.Time);


if (global.GameState == GameStates.PLAY){
	draw_sprite_stretched(spr_BBQ_health_bar,global.HealthBarSubImage,(display_get_gui_width() / 2) - 220, (display_get_gui_height() / 2) - 290, 10 * global.BBQHP,20);
}

if(global.BBQHP > 40){
	global.HealthBarSubImage = 0;
} else if (global.BBQHP > 30 && global.BBQHP < 40){
	global.HealthBarSubImage = 1;
} else if (global.BBQHP > 20 && global.BBQHP < 30){
	global.HealthBarSubImage = 2;
} else if(global.BBQHP > 10 && global.BBQHP < 20){
	global.HealthBarSubImage = 3;
} else if(global.BBQHP < 10){
	global.HealthBarSubImage = 4;
}