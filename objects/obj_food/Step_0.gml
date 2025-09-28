
var player = instance_find(obj_player, 0); 

// Check if the food has a valid owner (i.e., the player instance)
if (player != noone)
{
	var dropButton = keyboard_check_pressed(ord("D"));
	
	if(player.current_food != noone and keyboard_check_pressed(ord("F"))){
		
		foodIsDropped = true;
		
		// Stop following the player
        x = player.x;
        y = player.y;
		
		// clear food instance info from player
		with(player)
		{
			player.current_food = noone;
		}
	}
	
	if(!foodIsDropped){
		// Define the offset for the 'hand' position (adjust these values as needed)
	    var offset_y = -10; 
    
	    // Update the food's position to match the owner's position plus the offset
	    x = player.x;
	    y = player.y + offset_y;
		
		// Find the unique instance ID of the closest 'obj_target' to the current instance's (x, y)
		nearest_pit = instance_nearest(x, y, obj_bbq);
		
		// placing it on the pit
		if(nearest_pit != noone and distance_to_point(nearest_pit.x, nearest_pit.y) < distanceToPit)
		{		
			var interactButton = keyboard_check_pressed(ord("E"));
		
			// place food on grill
			if(interactButton)
			{
				if(nearest_pit.food_on_grill == noone)
				{
					x = nearest_pit.x;
					y = nearest_pit.y - 16;
				
					// pass instance info to grill object
					nearest_pit.food_on_grill = id;
				
					// clear food instance info from player
					with(player)
					{
						player.current_food = noone;
					}
				
					if(nearest_pit.food_on_grill.sprite_index == spr_SaltAndPepper)
					{
						// Damage buff effect
						obj_thrown_knife.BASE_DMG += 1;
					}
					else if(nearest_pit.food_on_grill.sprite_index == spr_Potato)
					{
						//apply food effect
						nearest_pit.hp += 10;
						nearest_pit.hp = min(obj_bbq.hp, 50);
					}
					else if(nearest_pit.food_on_grill.sprite_index == spr_Thyme)
					{
						// Apply Decrease time cooldown ability
						global.TimeStopCoolDownDuration += 1;
					}
				
					instance_destroy();
				}
			}
		}
	}//end of if
}