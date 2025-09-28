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

    // Title
    draw_text(gui_x + rect_w / 2, gui_y + 20, "SHOP MENU");

    // Shop items
    draw_text(gui_x + rect_w / 2, gui_y + 70,  "1. Salt and Pepper (40)");
    draw_text(gui_x + rect_w / 2, gui_y + 120, "2. Potato (10)");
    draw_text(gui_x + rect_w / 2, gui_y + 170, "3. Thyme (50)");

    // Divider line (optional, for clarity)
    draw_line(gui_x + 20, gui_y + 250, gui_x + rect_w - 20, gui_y + 250);

    // Stats
    draw_text(gui_x + rect_w / 2, gui_y + 260, "Current Damage: 10");
    draw_text(gui_x + rect_w / 2, gui_y + 290, "Current Health: 50");
    draw_text(gui_x + rect_w / 2, gui_y + 330, "Cooldown: 5s");

    // Currency (anchored bottom-center for balance)
    draw_text(gui_x + rect_w / 2, gui_y + rect_h - 40, "CURRENCY: 0");

    // 3. Reset settings
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
	
	
	draw_set_font(font_menu);
}
