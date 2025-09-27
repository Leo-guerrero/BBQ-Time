
// initialize draw
draw_self();

// use font
draw_set_font(font_menu);

// align text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// draw text
draw_text(x, y, button_text);

draw_set_halign(fa_left);
draw_set_valign(fa_top);