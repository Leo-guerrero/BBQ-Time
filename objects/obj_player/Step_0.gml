// --- STEP EVENT ---

// 1. Input check (once per frame)
up    = keyboard_check(ord("W"));
down  = keyboard_check(ord("S"));
left  = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
attack = mouse_check_button_pressed(mb_left);
run = keyboard_check(vk_shift);

// 2. State machine
switch(State){
    case PlayerState.IDLE:
        image_index = 0;
		switch(global.PlayerFace){
            case "DOWN":  sprite_index = Player_down_spr;  break;
            case "UP":    sprite_index = Player_up_spr;    break;
            case "LEFT":  sprite_index = Player_left_spr;  break;
            case "RIGHT": sprite_index = Player_right_spr; break;
        }
		

        if(attack){
			image_index = 0;
            State = PlayerState.ATTACKING;
			
            break;
        }

        if(up || down || left || right){
            State = (run ? PlayerState.RUNNING : PlayerState.MOVING);
        }
        break;

    case PlayerState.MOVING:
    case PlayerState.RUNNING:
        move_speed = State == PlayerState.RUNNING ? 2.4 : 1.2;

        if(attack){
            State = PlayerState.ATTACKING;
            break;
        }

        xspeed = (right - left) * move_speed;
        yspeed = (down - up) * move_speed;

        if(xspeed == 0 && yspeed == 0){
            State = PlayerState.IDLE;
        }

        // Sprite direction
        if(xspeed > 0){
            sprite_index = Player_right_spr;
            global.PlayerFace = "RIGHT";
        } 
        else if(xspeed < 0){
            sprite_index = Player_left_spr;
            global.PlayerFace = "LEFT";
        } 
        else if(yspeed > 0){
            sprite_index = Player_down_spr;
            global.PlayerFace = "DOWN";
        } 
        else if(yspeed < 0){
            sprite_index = Player_up_spr;
            global.PlayerFace = "UP";
        }
        break;

    case PlayerState.ATTACKING:
	
		/*
		if(up || down || left || right){
            State = (run ? PlayerState.RUNNING : PlayerState.MOVING);
        }*/
	
		xspeed = (right - left) * move_speed;
        yspeed = (down - up) * move_speed;
        switch(global.PlayerFace){
            case "DOWN":  sprite_index = attack_down;  break;
            case "UP":    sprite_index = attack_up;    break;
            case "LEFT":  sprite_index = attack_left;  break;
            case "RIGHT": sprite_index = attack_right; break;
        }

        // Wait a bit so attack animation plays
        if(image_index >= sprite_get_number(sprite_index) - 1){
            State = PlayerState.IDLE;
        }
        break;
}

// 3. Movement application
x += xspeed;
y += yspeed;