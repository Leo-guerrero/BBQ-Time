var gw = display_get_gui_width(), gh = display_get_gui_height();

// Pause overlay
if (state == GameState.PAUSE) {
    draw_set_alpha(0.6); draw_set_color(c_black); draw_rectangle(0,0,gw,gh,false); draw_set_alpha(1);
    draw_set_color(c_white); draw_set_halign(fa_center); draw_set_valign(fa_middle);
    draw_text(gw*0.5, gh*0.3, "PAUSED");
}
// End-game overlay
else if (global.GameState == GameStates.GAMEOVER) {
	// update rank
	if (global.BBQHP == 50)
	{
		global.Rank = "S"
	}
	else if (global.BBQHP >= 40)
	{
		global.Rank = "A"
	}
	else if (global.BBQHP >= 30)
	{
		global.Rank = "B"
	}
	else if (global.BBQHP >= 20)
	{
		global.Rank = "C"
	}
		else if (global.BBQHP >= 10)
	{
		global.Rank = "D"
	}
	else
	{
		global.Rank = "F"
	}
	
	
	
    // translucent dim
    draw_set_alpha(0.6); draw_set_color(c_black);
    draw_rectangle(0, 0, gw, gh, false);
    draw_set_alpha(1);

    // header + rank
    draw_set_color(c_yellow);
    draw_set_halign(fa_center); draw_set_valign(fa_middle);
    draw_text(gw*0.5, gh*0.25, end_reason);
	

    draw_set_color(c_white);
    draw_text(gw*0.5, gh*0.35, "Rank: " + global.Rank);

    // --- buttons ---
    var bx = gw*0.5;          // center X
    var by1 = gh*0.60;        // Restart button Y
    var by2 = by1 + 64;       // Menu button Y
    var bw  = 240, bh = 48;   // button width/height

    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    // Restart button rect
    var x1 = bx - bw/2, y1 = by1 - bh/2, x2 = bx + bw/2, y2 = by1 + bh/2;
    var hover1 = (mx >= x1 && mx <= x2 && my >= y1 && my <= y2);

    draw_set_color(hover1 ? c_ltgray : c_dkgray);
    draw_rectangle(x1, y1, x2, y2, false);
    draw_set_color(c_white);
    draw_text(bx, by1, "Restart");

    if (hover1 && mouse_check_button_pressed(mb_left)) {
        audio_stop_all();
        instance_activate_all();   // re-activate world (you paused with deactivate_all)
        room_restart();
		global.GameState = GameStates.PLAY;
		global.BBQHP = 50;
    }

    // Menu button rect
    x1 = bx - bw/2; y1 = by2 - bh/2; x2 = bx + bw/2; y2 = by2 + bh/2;
    var hover2 = (mx >= x1 && mx <= x2 && my >= y1 && my <= y2);

    draw_set_color(hover2 ? c_ltgray : c_dkgray);
    draw_rectangle(x1, y1, x2, y2, false);
    draw_set_color(c_white);
    draw_text(bx, by2, "Menu");

    if (hover2 && mouse_check_button_pressed(mb_left)) {
        audio_stop_all();
        instance_activate_all();
		global.GameState = GameStates.MENU
        room_goto(room_menu);        // <-- replace with your menu room asset
    }
}