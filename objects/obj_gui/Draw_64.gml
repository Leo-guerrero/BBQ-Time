var gw = display_get_gui_width(), gh = display_get_gui_height();

// Pause overlay
if (state == GameState.PAUSE) {
    draw_set_alpha(0.6); draw_set_color(c_black); draw_rectangle(0,0,gw,gh,false); draw_set_alpha(1);
    draw_set_color(c_white); draw_set_halign(fa_center); draw_set_valign(fa_middle);
    draw_text(gw*0.5, gh*0.3, "PAUSED");
}

// End-game overlay
if (state == GameState.GAMEOVER) {
    draw_set_alpha(0.6); draw_set_color(c_black); draw_rectangle(0,0,gw,gh,false); draw_set_alpha(1);
    draw_set_color(c_yellow); draw_set_halign(fa_center); draw_set_valign(fa_middle);
    draw_text(gw*0.5, gh*0.25, end_reason);
    draw_set_color(c_white);
    draw_text(gw*0.5, gh*0.35, "Rank: " + rank);
}