var gw = display_get_gui_width();
var gh = display_get_gui_height();

// End-game overlay
if (global.GameState == GameStates.GAMEOVER) {
    // update rank
    if (global.BBQHP == 50) {
        global.Rank = "SPlus";
    } else if (global.BBQHP >= 40) {
        global.Rank = "S";
    } else if (global.BBQHP >= 30) {
        global.Rank = "A";
    } else if (global.BBQHP >= 20) {
        global.Rank = "B";
    } else if (global.BBQHP >= 10) {
        global.Rank = "C";
    } else {
        global.Rank = "FAIL";
    }

    // translucent dim
    draw_set_alpha(0.6); draw_set_color(c_black);
    draw_rectangle(0, 0, gw, gh, false);
    draw_set_alpha(1);

    // header + rank text
    draw_set_color(c_yellow);
    draw_set_halign(fa_center); draw_set_valign(fa_middle);
    draw_text(gw*0.5, gh*0.25, end_reason);

    //draw_set_color(c_white);
    //draw_text(gw0.5, gh0.35, "Rank: " + global.Rank);

    // --- buttons ---
    var bx = gw*0.5;          // center X
    var by1 = gh*0.60;        // Restart button Y
    var by2 = by1 + 64;       // Menu button Y
    var bw  = 240, bh = 48;   // button width/height

    // --- ADDED: draw FinishRank_A sprite above the Restart button ---

    // --- draw FinishRankA centered above the Restart button ---
    // --- draw FinishRank[Rank] centered above the Restart button (50% bigger) ---
    var rank_key = string_replace_all(string(global.Rank), "+", "Plus"); // e.g., "S+" -> "SPlus"
    var spr_name = "FinishRank_" + rank_key;                              // e.g., FinishRank_SPlus
    var spr_rank = asset_get_index(spr_name);                             // sprite resource (no .png)

    if (spr_rank != -1) {
        var sw = sprite_get_width(spr_rank);
        var sh = sprite_get_height(spr_rank);
        var xo = sprite_get_xoffset(spr_rank);
        var yo = sprite_get_yoffset(spr_rank);
		var gap = 16;  // space between sprite and the Restart button
        var baseScale  = min((bw * 0.90) / sw, (gh * 0.28) / sh);
        var scale      = baseScale * 1.5;   // <-- 50% bigger

        // desired center position for the sprite (same X as buttons)
        var cx = bx;
        var cy = by1 - (bh * 0.5) - gap - (sh * scale * 0.5);

        // convert center -> draw position compensating for origin
        var px = cx + (xo - sw * 0.5) * scale;
        var py = cy + (yo - sh * 0.5) * scale;
		
        draw_sprite_ext(spr_rank, 0, px, py, scale, scale, 0, c_white, 1);
    } else {
        // fallback if sprite not found
        draw_set_color(c_white);
        draw_text(bx, by1 - bh - 24, "Rank: " + string(global.Rank));
    }

    // --- end ADDED ---

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
        global.GameState = GameStates.RESTART;
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
        global.GameState = GameStates.MENU;
        room_goto(room_menu); // <-- replace with your menu room asset
    }
}