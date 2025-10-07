
if(nearest_pit != noone and distance_to_point(nearest_pit.x, nearest_pit.y) < distanceToPit)
{
	// Drawing text above the pit
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_jason);
	draw_set_color(c_white);

	draw_text(nearest_pit.x, nearest_pit.y - 32, "Press E to place");
		
	draw_set_font(font_menu);
}
