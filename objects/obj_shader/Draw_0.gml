
if(hit_flash_active)
{
	// Set target to the shader asset in shaders folder
	shader_set(shd_hit_flash);

	// setting shader uniform values
	var u_time = shader_get_uniform(shd_hit_flash, "u_time");
	var u_hit_flash_timer = shader_get_uniform(shd_hit_flash, "u_hit_flash_timer");

	// Pass time
	// 1000 miliseconds = 1 second
	shader_set_uniform_f(u_time, current_time / 1000.0);
	shader_set_uniform_f(u_hit_flash_timer, hit_flash_timer);

	// Draw the player sprite
	draw_self();

	shader_reset();
}else
{
	// Draw the player
	draw_self();
}
