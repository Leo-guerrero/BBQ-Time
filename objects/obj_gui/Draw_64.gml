// GUI coordinates (fixed to the screen, ignores camera)
var gw = display_get_gui_width();
var gh = display_get_gui_height();

// Example HUD text (top-left)
draw_set_color(c_white);
draw_set_halign(fa_left); draw_set_valign(fa_top);
draw_text(16, 16, "Mobs: " + string(instance_number(obj_enemy)));

// Example translucent full-screen overlay
// (handy for pause/end screens)
draw_set_alpha(0.6);
draw_set_color(c_black);
draw_rectangle(0, 0, gw, gh, false);
draw_set_alpha(1);