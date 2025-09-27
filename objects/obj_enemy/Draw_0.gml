draw_self();

if (hp != maxHp) {
    var bar_w = 15; // max width of bar in pixels
    var bar_h = 4;  // height of bar
    var bar_x = x - bar_w / 2;
    var bar_y = y - 12;

    // % of health
    var hp_ratio = hp / maxHp;

    // draw current health
	draw_sprite_stretched(spr_ENEMY_health_bar_back, 0, bar_x, bar_y, bar_w * for_back_heath_bar, bar_h);
    draw_sprite_stretched(spr_ENEMY_health_bar, 0, bar_x, bar_y, bar_w * hp_ratio, bar_h);
	
}