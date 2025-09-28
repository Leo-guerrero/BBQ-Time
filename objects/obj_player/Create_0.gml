enum PlayerState { 
	IDLE,
	MOVING,
	SHOOTING,
	ATTACKING,
	RUNNING
} 

depth = 0

xspeed = 0;
yspeed = 0;

move_speed = 1.2;

State = PlayerState.MOVING;

TIME_STOP_DURATION = 10; // s
time_stop_uses = 0;

up = 0;
down = 0;
left = 0;
right = 0;
attack = mouse_check_button_pressed(mb_left);
run = keyboard_check(vk_shift);

hp = 100