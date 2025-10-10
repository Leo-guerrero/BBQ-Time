
var player = instance_find(obj_player, 0); 


//player exists
if(player != noone){ 
	if (!player.is_timestop) {
		depth = -y-16
	} else {
		depth = -501	
	}
	
	//player close to shop
	if(distance_to_point(player.x, player.y) < 20 && !obj_player.is_timestop)
	{
		if(keyboard_check_pressed(ord("E")) and !inShopMenu)
		{
			inShopMenu = true;
			dilation_changed = true;
			global.DilationFactor = 0;
		}
		
		if(inShopMenu)
		{
			depth = -501

			var one = keyboard_check_pressed(ord("1"));
			var two = keyboard_check_pressed(ord("2"));
			var three = keyboard_check_pressed(ord("3"));
			
			if(one and player.current_food == noone and global.Coins >= 10)
			{
				show_debug_message("Grabbed Salt and Pepper");
				addFoodToPlayer(player, FOODS.SaltAndPepper);
				
				// offsetting the food to the player hands is in the food script
				
				global.Coins-=10;
			}
			else if(two and player.current_food == noone and global.Coins >= 5)
			{				
				show_debug_message("Grabbed Potato");
				addFoodToPlayer(player, FOODS.Potato);
				
				// offsetting the food to the player hands is in the food script
				
				global.Coins-=5;
			}
			else if(three and player.current_food == noone and global.Coins >= 20)
			{
				show_debug_message("Grabbed Thyme");
				addFoodToPlayer(player, FOODS.Thyme);

				global.Coins-=20;
			}
			
			// apply blue tint
			var _fx_tint = fx_create("_filter_colourise");
			fx_set_parameter(_fx_tint, "g_TintCol", [0, 0, 0, 0.01]);
			fx_set_parameter(_fx_tint, "g_Intensity", 1);
			layer_set_fx("Dilation", _fx_tint);
			obj_player.depth = -600
		}
	}else
	{
		//set time dilation back to 1
		if (dilation_changed) {
			dilation_changed = false;
			global.DilationFactor = 1;
			
			var _fx_tint = fx_create("_filter_colourise");
			fx_set_parameter(_fx_tint, "g_TintCol", [0, 0, 0, 0.01]);
			fx_set_parameter(_fx_tint, "g_Intensity", 0);
			layer_set_fx("Dilation", _fx_tint);
		}
		inShopMenu = false; 
	}
}
