
var dt =  room_speed/60

var target = [BBQ_target.x, BBQ_target.y];
//var target = [po_bbq.x, po_bbq.y];
direction = point_direction(x, y, target[0], target[1])
speed = base_speed * room_speed/60

speed = 0

switch (cur_state)
{
	case ENEMY_STATE.Walking:
		var target = [BBQ_target.x, BBQ_target.y];
		direction = point_direction(x, y, target[0], target[1])
		speed = BASE_SPEED * dt
	
		var bbq = instance_place(x, y, BBQ_target)

		if (bbq != noone) {
			bbq.hp -= BASE_DMG;
			cur_state = ENEMY_STATE.Recharging
			cur_cooldown = ATK_COOLDOWN;
			// add attack animation too
			show_debug_message("Attacked")
		}
	break;
	
	case ENEMY_STATE.Recharging:
	// TODO add animation frames state later
	
		cur_cooldown -= dt/60;
	
		if (cur_cooldown <= 0) {
			cur_cooldown = 0;
			cur_state = ENEMY_STATE.Walking;
		}
	break;
	
}

	

