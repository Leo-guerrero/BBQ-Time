global.Time = room_speed * 60 * 1;
//global.Time = room_speed * 2 * 1;

global.TimeDisplay = global.Time / 60 ;

global.TimeStopDuration = 5;//how long you can use the ability
global.TimeStopCoolDownDuration = 10; //time between using the ability again

global.PlayerFace = "DOWN";
global.KnifeCount = 10;
global.IsRecallKnives = false;
global.BBQHP = 50;
global.StaticBBQHP = 10 * 50;
global.HealthBarSubImage = 0;

global.DilationFactor = 1;

enum GameStates { MENU, PLAY, PAUSE, RESTART, GAMEOVER }
global.GameState = GameStates.MENU;
global.end_reason = "TIME'S UP";
global.Rank       = "S+";

gpu_set_texfilter(false);
fullscreen = true;
window_set_fullscreen(fullscreen);
