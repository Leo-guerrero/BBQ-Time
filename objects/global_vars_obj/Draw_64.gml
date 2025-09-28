
var total_seconds = floor(global.Time / room_speed);

var minutes = total_seconds div 60;
var seconds = total_seconds mod 60;

if (room == JasonsBedroom)
{
	draw_text(32, 32, string(minutes) + ":" + string_format(seconds, 2, 0));
}
//draw_text(x,y + 10, global.Time);


if (global.GameState == GameStates.PLAY){
	draw_sprite_stretched(spr_BBQ_health_bar_back,0,(display_get_gui_width() / 2) - 220, 30, global.StaticBBQHP,20);
	draw_sprite_stretched(spr_BBQ_health_bar,global.HealthBarSubImage,(display_get_gui_width() / 2) - 220, 30, 10 * global.BBQHP,20);
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


if(!instance_exists(obj_player) && room == JasonsBedroom){
	
	var Respawnseconds = floor(global.PlayerRespawnDelay / room_speed);

	draw_text_transformed(display_get_gui_width() / 2, display_get_height() / 2, string(Respawnseconds), 2,2,0);
}


// draw ability gui
if (global.GameState == GameStates.PLAY){
	
	//coins
	draw_sprite_stretched(spr_money, 0, display_get_gui_width()/2 - 300, display_get_gui_height()-80, 75, 75)
	draw_text(display_get_gui_width()/2 - 270, display_get_gui_height()-60, "x"+string(global.Coins))

	draw_sprite_stretched(spr_icon_Dilate, 0, display_get_gui_width()/2 - 150, display_get_gui_height()-80, 75, 75)
	
	draw_sprite_stretched(spr_icon_Recall, 0, display_get_gui_width()/2 - 50, display_get_gui_height()-80, 75, 75)

	draw_set_alpha(0.5);
	draw_set_colour(c_black);
	if (obj_player.is_timestop) {
		draw_rectangle(display_get_gui_width()/2-150, display_get_gui_height()-80, display_get_gui_width()/2-75, display_get_gui_height()-5, false)
	} else {
		draw_rectangle(display_get_gui_width()/2-150, display_get_gui_height()-5-75*(obj_player.timestop_cooldown_remaining/global.TimeStopCoolDownDuration), display_get_gui_width()/2-75, display_get_gui_height()-5, false)
	}
	if (obj_player.is_knife_recall) {
		draw_rectangle(display_get_gui_width()/2-50, display_get_gui_height()-80, display_get_gui_width()/2+25, display_get_gui_height()-5, false)
	} else {
		draw_rectangle(display_get_gui_width()/2-50, display_get_gui_height()-5-75*(obj_player.recall_cooldown_remaining/global.RecallKnivesCooldown), display_get_gui_width()/2+25, display_get_gui_height()-5, false)
	}
	draw_set_alpha(1)
	draw_set_colour(c_white);
	
	draw_set_font(-1)
	draw_text(display_get_gui_width()/2 - 134, display_get_gui_height()-25, "[SPACE]")
	draw_text(display_get_gui_width()/2, display_get_gui_height()-25, "[F]")
	draw_set_font(font_menu)


	draw_sprite_stretched(spr_icon_empty, 0, display_get_gui_width()/2 + 50, display_get_gui_height()-80, 75, 75)
	draw_sprite_stretched(spr_knife, 0, display_get_gui_width()/2 + 55, display_get_gui_height()-75, 30, 30)
	draw_text(display_get_gui_width()/2 + 74 - 20*(string_length(string(global.KnifeCount))-1), display_get_gui_height()-65, string(global.KnifeCount))
}

