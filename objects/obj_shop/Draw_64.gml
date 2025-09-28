// DRAW GUI EVENT

if (inShopMenu)
{
	// 1. Draw the background rectangle (the black square)
    draw_set_colour(c_black);
	
	draw_set_font(fnt_jason);

    // Draw a FILLED rectangle from the calculated top-left (gui_x, gui_y)
    // to the bottom-right corner.
    draw_rectangle(gui_x, gui_y, gui_x + rect_w, gui_y + rect_h, false);
    
    // 2. Add text and options over the box
    draw_set_colour(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    
    draw_text(gui_x + rect_w / 2, gui_y + 20, "SHOP MENU");
    
    // Example menu option
    draw_text(gui_x + rect_w / 2, gui_y + 60, "1. Salt and Pepper (More Damage)");
    draw_text(gui_x + rect_w / 2, gui_y + 120, "2. Potato (Health)");
    draw_text(gui_x + rect_w / 2, gui_y + 180, "3. Thyme (Decrease Time Cooldown Duration)");
    
    // 3. Reset settings
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
	draw_set_font(font_menu);

}