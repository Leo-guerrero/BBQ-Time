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

current_food = noone;

State = PlayerState.MOVING;

up = 0;
down = 0;
left = 0;
right = 0;
attack = mouse_check_button_pressed(mb_left);
run = keyboard_check(vk_shift);

hp = 100