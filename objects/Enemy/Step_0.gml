var dt =  room_speed/60

speed = 0

if (!can_attack) {
	cur_cooldown -= dt/60;
	
	if (cur_cooldown <= 0) {
		cur_cooldown = 0;
		can_attack = true;
	}
	
} else {
	var target = [BBQ_target.x, BBQ_target.y];
	direction = point_direction(x, y, target[0], target[1])
	speed = BASE_SPEED * dt
	
	var bbq = instance_place(x, y, BBQ_target)

	if (bbq != noone && can_attack) {
		bbq.hp -= BASE_DMG;
		can_attack = false;
		cur_cooldown = ATK_COOLDOWN;
		// add attack animation too
		show_debug_message("Attacked")
	}
}


