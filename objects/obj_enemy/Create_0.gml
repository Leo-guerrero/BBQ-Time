enum ENEMY_STATE {
	Walking,
	Charging,
	Attacking
}

BASE_SPEED = 0.5;
ATK_CHARGETIME = 0.5;
BASE_DMG = 5;
ATK_RADIUS = 10

hp = 15;
cur_state = ENEMY_STATE.Walking;

cur_chargetime = 0;
maxHp = 50;

cur_cooldown = 0;
maxHp = 15;


attack_target = noone

for_back_heath_bar = hp / maxHp;

