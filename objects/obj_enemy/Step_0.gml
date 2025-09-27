if(global.game_paused){
	exit;
}

var dt =  room_speed/60 * global.DilationFactor

depth = -y - 1
var dt =  room_speed/60


var target = [obj_bbq.x, obj_bbq.y];
//var target = [po_bbq.x, po_bbq.y];
direction = point_direction(x, y, target[0], target[1])

var xspeed = lengthdir_x(BASE_SPEED, direction);
var yspeed = lengthdir_y(BASE_SPEED, direction);


if(place_meeting(x + xspeed, y, obj_main_object)){
	xspeed = 0;
}
if(place_meeting(x,y + yspeed, obj_main_object)){
	yspeed = 0;
}

if(xspeed > 0){
	image_xscale = -1
}else if (xspeed < 0){
	image_xscale = 1;
}

x+= xspeed;
y +=yspeed;

// TODO vary with time dilation
image_speed = 0.5*global.DilationFactor

speed = 0

switch (cur_state)
{
	case ENEMY_STATE.Walking:
		var target = [obj_bbq.x, obj_bbq.y];
		direction = point_direction(x, y, target[0], target[1])
		//speed = BASE_SPEED * dt
		
		//set animation
		image_xscale = (target[0]-x > 0) ? 1 : -1;
	
		var to_attack = instance_place(x, y, [obj_bbq, obj_player])

		if (to_attack != noone) {
			global.BBQHP -= BASE_DMG;
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

if(place_meeting(x,y,obj_thrown_knife)){
	var inst = instance_place(x,y,obj_thrown_knife);
	
	if(inst.BASE_SPEED > 0){
		hp--;
	}
	
}

if(hp <= 0){
	instance_destroy();
}

	

