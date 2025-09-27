enum ENEMY_STATE {
	Walking,
	Recharging
}

BASE_SPEED = 0.5;
ATK_COOLDOWN = 4;
BASE_DMG = 5;

hp = 50;
cur_state = ENEMY_STATE.Walking;
cur_cooldown = 0;
maxHp = 50;

for_back_heath_bar = hp / maxHp;