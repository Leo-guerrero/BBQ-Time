// toggle for pause

/*
if (keyboard_check(vk_escape))
{
	global.game_paused = !global.game_paused;
	
	if (global.game_paused) {
        // freeze world; keep THIS instance alive
        instance_deactivate_all(true);
        audio_pause_all();
    } else {
        instance_activate_all();
        audio_resume_all();
    }
}*/

if (keyboard_check_pressed(vk_escape)) {
    global.game_paused = !global.game_paused; // toggle
   
}