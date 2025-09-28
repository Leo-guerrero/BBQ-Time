depth = -y + 1

if (!global.IsRecallKnives){
	speed = BASE_SPEED * room_speed/60  * global.DilationFactor

	if(life_time > 0){
		life_time--;
	}

	if(BASE_SPEED > 0){
		BASE_SPEED -= 0.09;
		if(BASE_SPEED < 0){
			BASE_SPEED = 0;	
		}
	}

	if(life_time <= 0){
		BASE_SPEED = 0;
	}
	if(place_meeting(x,y,obj_player) && BASE_SPEED == 0){
			global.KnifeCount++;
			instance_destroy();
	}
	

	if(place_meeting(x,y,obj_main_object)){
		BASE_SPEED = 0;
	}
} else {
	BASE_SPEED = 3.8
	speed = BASE_SPEED * room_speed/60
	var target = [obj_player.x, obj_player.y]
	direction = point_direction(x, y, target[0], target[1])
	if(place_meeting(x,y,obj_player)){
		global.KnifeCount++;
		instance_destroy();
	}
}

