// center of the room
var cx = room_width div 2;
var cy = room_height div 2;

// spawn the top button
instance_create_layer(cx, cy-150, "Instances", obj_controls_text);

// spawn the second button below the first
instance_create_layer(cx, cy + 250, "Instances", obj_btn_help_to_menu);