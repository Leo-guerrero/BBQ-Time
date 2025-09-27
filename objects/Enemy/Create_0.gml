enum ENEMY_STATE {
	Walking,
	Recharging
}

BASE_SPEED = 0.5;
ATK_COOLDOWN = 4;
BASE_DMG = 5;

hp = 10;
cur_state = ENEMY_STATE.Walking;
cur_cooldown = 0;
