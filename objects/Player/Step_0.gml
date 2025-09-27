switch(State){
	case PlayerState.IDLE:
		image_index = 0;
		
		up = keyboard_check(ord("W"));
		down = keyboard_check(ord("S"));
		left = keyboard_check(ord("A"));
		right = keyboard_check(ord("D"));
		
		if(up || down || left || right){
			State = PlayerState.MOVING;
		}
		
		
		break;
		
	case PlayerState.MOVING:
	
		if(xspeed == 0 && yspeed == 0){
			State = PlayerState.IDLE;
		}
	
		up = keyboard_check(ord("W"));
		down = keyboard_check(ord("S"));
		left = keyboard_check(ord("A"));
		right = keyboard_check(ord("D"));
		
		xspeed = (right - left) * move_speed;
		yspeed = (down - up) * move_speed;
		
		if(xspeed > 0){
			sprite_index = Player_right_spr;
		} 
		if(xspeed < 0){
			sprite_index = Player_left_spr;
		} 
		if(yspeed > 0){
			sprite_index = Player_down_spr;
		} 
		if(yspeed < 0){
			sprite_index = Player_up_spr;
		} 
		
		x += xspeed;
		y += yspeed;
		
		break;
		
	case PlayerState.SHOOTING:
		break;
		
	case PlayerState.ATTACKING:
		
		
		break;
	

}