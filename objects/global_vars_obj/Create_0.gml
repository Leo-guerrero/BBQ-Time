global.Time = room_speed * 60 * 1;

global.TimeDisplay = global.Time / 60 ;

global.PlayerFace = "DOWN";
global.KnifeCount = 10;
global.BBQHP = 50;
global.HealthBarSubImage = 0;

global.DilationFactor = 1;
global.game_paused = false;

enum GameStates { MENU, PLAY, PAUSE, GAMEOVER }
global.GameState = GameStates.MENU;
global.end_reason = "TIME'S UP";
global.rank       = "S+";

gpu_set_texfilter(false);
fullscreen = true;
window_set_fullscreen(fullscreen);
