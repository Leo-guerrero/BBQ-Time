
draw_self();


if(global.CurrentPlayerHP != global.MaxPlayerHp){
	


	var bar_w = 29; // max width of bar in pixels
    var bar_h = 5;  // height of bar
    var bar_x = x - bar_w / 2;
    var bar_y = y - 12;

    // % of health
    var hp_ratio = global.CurrentPlayerHP / global.MaxPlayerHp;

    // draw current health
	draw_sprite_stretched(spr_ENEMY_health_bar_back, 0, bar_x + 5, bar_y + 7, bar_w * for_back_heath_bar, bar_h);
    draw_sprite_stretched(spr_ENEMY_health_bar, 0, bar_x + 5, bar_y + 7, bar_w * hp_ratio, bar_h);
}