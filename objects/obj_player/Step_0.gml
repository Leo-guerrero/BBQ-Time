// --- STEP EVENT ---
if(global.GameState == GameStates.GAMEOVER){
	exit;
}

depth = -y

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
	if(up || down || left || right){
            State = (run ? PlayerState.RUNNING : PlayerState.MOVING);
        }
		
		
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
            case "DOWN":  
				sprite_index = attack_down;
				instance_create_depth(x,y + 6,-999,hurt_box);
				break;
            case "UP":    
				sprite_index = attack_up;    
				instance_create_depth(x,y - 6,-999,hurt_box);
				break;
            case "LEFT":  
				sprite_index = attack_left;  
				instance_create_depth(x - 6,y,-999,hurt_box);
				break;
            case "RIGHT": 
				sprite_index = attack_right; 
				instance_create_depth(x + 6,y,-999,hurt_box);
				break;
        }

        // Wait a bit so attack animation plays
        if(image_index >= sprite_get_number(sprite_index) - 1){
            State = PlayerState.IDLE;
			instance_destroy(hurt_box);
        }
        break;
		
	case PlayerState.SHOOTING:
	
		if(global.KnifeCount > 0){
			var inst_knife = instance_create_depth(x,y,1,obj_thrown_knife);
			inst_knife.direction = point_direction(x,y,mouse_x, mouse_y);
			inst_knife.image_angle = inst_knife.direction;
			global.KnifeCount--;
			State = PlayerState.IDLE;
		}
		State = PlayerState.IDLE;
		
		break;
}

if(mouse_check_button_pressed(mb_right)){
	State = PlayerState.SHOOTING;
}

if place_meeting(x + xspeed, y, obj_main_object){
	xspeed = 0;
}
if(place_meeting(x,y + yspeed, obj_main_object)){
	yspeed = 0;
}


// Sprite direction
        if(xspeed > 0){
            
            global.PlayerFace = "RIGHT";
        } 
        else if(xspeed < 0){
            
            global.PlayerFace = "LEFT";
        } 
        else if(yspeed > 0){
            
            global.PlayerFace = "DOWN";
        } 
        else if(yspeed < 0){
            
            global.PlayerFace = "UP";
        }

// 3. Movement application
x += xspeed;
y += yspeed;


// dilation afterimage

if (global.DilationFactor != 1) {

	instance_create_depth(x,y,1, obj_afterimage);
	
	var red_tint = layer_get_fx("Dilation");
	
	if (red_tint == -1) {
		
		var _fx_tint = fx_create("_filter_colourise");
		fx_set_parameter(_fx_tint, "g_TintCol", [1, 0, 0, 0.01]);
		fx_set_parameter(_fx_tint, "g_Intensity", min(abs(1-global.DilationFactor), 1));
		layer_set_fx("Dilation", _fx_tint);
		
	} 
}

if(global.CurrentPlayerHP <= 0){
	global.PlayerRespawnDelay = room_speed * 5;
	instance_destroy();
}