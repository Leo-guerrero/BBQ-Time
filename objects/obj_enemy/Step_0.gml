if(global.GameState == GameStates.GAMEOVER){
	exit;
}
var dt =  room_speed/60 * global.DilationFactor

depth = -y - 1


var target = [obj_bbq.x, obj_bbq.y];
//var target = [po_bbq.x, po_bbq.y];
direction = point_direction(x, y, target[0], target[1])

var xspeed = lengthdir_x(BASE_SPEED, direction)*global.DilationFactor;
var yspeed = lengthdir_y(BASE_SPEED, direction)*global.DilationFactor;


if(place_meeting(x + xspeed, y, obj_main_object)){
	xspeed = 0;
}
if(place_meeting(x,y + yspeed, obj_main_object)){
	yspeed = 0;
}


image_xscale = (xspeed > 0) ? 1 : -1


// TODO vary with time dilation
image_speed = 0.5*global.DilationFactor

switch (cur_state)
{
	case ENEMY_STATE.Walking:
		direction = point_direction(x, y, target[0], target[1])
		x+= xspeed;
		y+= yspeed;

		//set animation
	
		attack_target = instance_place(x, y, [obj_bbq, obj_player])

		if (attack_target != noone) {
			cur_state = ENEMY_STATE.Charging
		}
	break;
	
	case ENEMY_STATE.Charging:
		sprite_index = spr_zombie_still
		cur_chargetime += dt/60;
	
		if (cur_chargetime >= ATK_CHARGETIME) {
			cur_chargetime = 0;
			cur_state = ENEMY_STATE.Attacking;
		}
	break;
	
	case ENEMY_STATE.Attacking:
		sprite_index = spr_zombie_attack
	
		if(floor(image_index) >= sprite_get_number(sprite_index)-1) {
			
			//if place_meeting(x, y, attack_target) {
			//show_debug_message(attack_target)
			if instance_place(x, y, attack_target) {
				
				if(place_meeting(x,y,obj_bbq)){
					audio_play_sound(metal_hit_bbq, 10,false);
				}
				
				
				
				
				attack_target.hp -= BASE_DMG
				
			}
			
			
			if(instance_place(x,y,obj_player)){
				global.CurrentPlayerHP -= 20;
			}
			
			sprite_index = spr_zombie_R
			cur_state = ENEMY_STATE.Walking
		}
}

if(place_meeting(x,y,obj_thrown_knife)){
	var inst = instance_place(x,y,obj_thrown_knife);
	
	if (!hit_flash_active) {

		if(inst.BASE_SPEED > 0){
			audio_play_sound(zombie_hit, 10, false);
			hit_flash_active = true
			hp -= obj_thrown_knife.BASE_DMG;
		}
	}
}

if(place_meeting(x,y,hurt_box)){
	
	if(!hit_flash_active){
		var inst_hurt = instance_place(x,y,hurt_box)
		hp -= inst_hurt.damage;
		audio_play_sound(zombie_hit, 10, false);
		hit_flash_active = true
	}
	
}

if(hp <= 0){
	global.gold++;
	instance_destroy();
}


if(hit_flash_active)
{
	hit_flash_timer += dt/60;
	if(hit_flash_timer > INVINCIBLE_DUR)
	{
		hit_flash_timer = 0
		hit_flash_active = false;
	}
}
	

