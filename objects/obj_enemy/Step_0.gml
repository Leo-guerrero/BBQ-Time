
var dt =  room_speed/60 * global.DilationFactor

var target = [obj_bbq.x, obj_bbq.y];
//var target = [po_bbq.x, po_bbq.y];
direction = point_direction(x, y, target[0], target[1])

// TODO vary with time dilation
image_speed = 0.5*global.DilationFactor

speed = 0

switch (cur_state)
{
	case ENEMY_STATE.Walking:
		var target = [obj_bbq.x, obj_bbq.y];
		direction = point_direction(x, y, target[0], target[1])
		speed = BASE_SPEED * dt
		
		//set animation
		image_xscale = (target[0]-x > 0) ? 1 : -1;
	
		var to_attack = instance_place(x, y, [obj_bbq, obj_player])

		if (to_attack != noone) {
			to_attack.hp -= BASE_DMG;
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

	

