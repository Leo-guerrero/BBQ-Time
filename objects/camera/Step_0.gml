var target_x = Player.x - (camera_get_view_width(cam) / 2);
var target_y = Player.y - (camera_get_view_width(cam) / 2);

// Smooth follow
var new_x = lerp(camera_get_view_x(cam), target_x, cam_speed);
var new_y = lerp(camera_get_view_y(cam), target_y, cam_speed);

// Apply to camera
camera_set_view_pos(cam, new_x, new_y);