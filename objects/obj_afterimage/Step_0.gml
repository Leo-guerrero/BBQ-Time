var dt =  room_speed/60

image_alpha = cur_dur/FADE_DURATION

cur_dur -= dt/60;

if (cur_dur <= 0) {
	instance_destroy()	
}