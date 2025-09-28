global.Time = room_speed * 60 * 1;

global.TimeDisplay = global.Time / 60 ;

global.TimeStopDuration = 5;//how long you can use the ability
global.TimeStopCoolDownDuration = 10; //time between using the ability again

global.PlayerFace = "DOWN";
global.KnifeCount = 10;
global.BBQHP = 50;
global.HealthBarSubImage = 0;

global.DilationFactor = 1;
global.game_paused = false;

gpu_set_texfilter(false);
fullscreen = true;
window_set_fullscreen(fullscreen);
