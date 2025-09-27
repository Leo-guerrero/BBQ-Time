speed = BASE_SPEED * room_speed/60  * global.DilationFactor

if(life_time > 0){
	life_time--;
}

if(life_time <= 0){
	BASE_SPEED = 0;
}

if(place_meeting(x,y,obj_player) && keyboard_check_pressed(ord("E"))){
	global.KnifeCount++;
	instance_destroy();
}