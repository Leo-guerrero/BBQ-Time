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
timestop = keyboard_check(vk_space)
recallknives = keyboard_check(ord("F"))

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


// handle knife recall
if (recall_cooldown_remaining == 0) {
	
	if (recallknives && !is_knife_recall && global.KnifeCount < global.MaxKnives) {
		is_knife_recall = true
	} else if (is_knife_recall) {
		recallanimation += room_speed / 3600;
		global.IsRecallKnives = true;
		
		var _fx_tint = fx_create("_filter_colourise");
		fx_set_parameter(_fx_tint, "g_TintCol", [0, 0, 1, 0.01]);
		fx_set_parameter(_fx_tint, "g_Intensity", (is_knife_recall) ? max(0, 1-(recallanimation/0.5)) : 0);
		
		if (global.KnifeCount == global.MaxKnives) {
			global.IsRecallKnives = false;
			is_knife_recall = false;
			recall_cooldown_remaining = global.RecallKnivesCooldown
			fx_set_parameter(_fx_tint, "g_Intensity", 0);
			recallanimation = 0;
		}
		layer_set_fx("Dilation", _fx_tint);
	}
} else {
	recall_cooldown_remaining = max(0, recall_cooldown_remaining - room_speed/3600)
	global.IsRecallKnives = false;
}

// handle time dilation
if (timestop_cooldown_remaining == 0) {
	
	if (timestop && !is_timestop) {
		is_timestop = true;
		global.DilationFactor = 0.5
	} else if (is_timestop) {
		timestop_elapsed += room_speed / 3600;
		
		// dilation afterimage
		if (is_timestop) {
			instance_create_depth(x,y,1, obj_afterimage);
		}
	
		var _fx_tint = fx_create("_filter_colourise");
		fx_set_parameter(_fx_tint, "g_TintCol", [0, 0, 1, 0.01]);
		fx_set_parameter(_fx_tint, "g_Intensity", (is_timestop) ? 1-(timestop_elapsed/global.TimeStopDuration) : 0);
		layer_set_fx("Dilation", _fx_tint);
		

	} 
}

if(global.CurrentPlayerHP <= 0){
	global.PlayerRespawnDelay = room_speed * 5;
	instance_destroy();
}

		if (timestop_elapsed >= global.TimeStopDuration) {
			is_timestop = false;
			global.DilationFactor = 1
			timestop_elapsed = 0
			timestop_cooldown_remaining = global.TimeStopCoolDownDuration;
		}
	}
} else {
	timestop_cooldown_remaining = max(0, timestop_cooldown_remaining - room_speed/3600)
}








//if (global.KnifeCount == 0) {
//	global.IsRecallKnives = true;	
//}
