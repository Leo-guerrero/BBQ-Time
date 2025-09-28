depth = -y + 1

if(global.damageLevelKnifes > 0){
	BASE_DMG = 18;
} else {
	BASE_DMG = 10;
}


if (!global.IsRecallKnives){
	speed = BASE_SPEED * room_speed/60  * global.DilationFactor

	if(life_time > 0){
		life_time--;
	}

	if(BASE_SPEED > 0){
		BASE_SPEED -= 0.09*global.DilationFactor;
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
	image_angle = direction
	if(place_meeting(x,y,obj_player)){
		global.KnifeCount++;
		instance_destroy();
	}
}

