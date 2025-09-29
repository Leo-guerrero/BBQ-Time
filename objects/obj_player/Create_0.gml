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

up = 0;
down = 0;
left = 0;
right = 0;
attack = mouse_check_button_pressed(mb_left);
run = keyboard_check(vk_shift);
timestop = keyboard_check(vk_space)
recallknives = keyboard_check(ord("f"))

timestop_elapsed = 0;
is_timestop = false;
timestop_cooldown_remaining = 0;

recallanimation = 0;
is_knife_recall = false;
recall_cooldown_remaining = 0;

hp =  global.MaxPlayerHp	
for_back_heath_bar = global.CurrentPlayerHP / global.MaxPlayerHp;