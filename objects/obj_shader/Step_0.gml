var bool_string = hit_flash_active ? "true" : "false";

if (keyboard_check_pressed(vk_space)) {
    hit_flash_active = !hit_flash_active
	hit_flash_timer = 0.3; // 0.3 seconds
	show_debug_message("hit_flash_active:" + bool_string)
}

if(hit_flash_active)
{
	// Decrease Timer by 1 Second by delta_time(microseconds) 
	hit_flash_timer -= delta_time / 1000000;
	if(hit_flash_timer < 0)
	{
		hit_flash_active = false;
		show_debug_message("hit_flash_active:" + bool_string)
	}
}

