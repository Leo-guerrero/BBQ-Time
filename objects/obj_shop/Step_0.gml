
var player = instance_find(obj_player, 0); 

//player exists
if(player != noone){ 
	
	//player close to shop
	if(distance_to_point(player.x, player.y) < 20)
	{
		
		if(keyboard_check_pressed(ord("E")) and !inShopMenu)
		{
			inShopMenu = true;
			global.DilationFactor = 0.5;
		}
		
		if(inShopMenu)
		{
			var one = keyboard_check_pressed(ord("1"));
			var two = keyboard_check_pressed(ord("2"));
			var three = keyboard_check_pressed(ord("3"));
			
			if(one and player.current_food == noone and global.Currency >= 40)
			{
				show_debug_message("Grabbed Salt and Pepper");
				addFoodToPlayer(player, FOODS.SaltAndPepper);
				
				// offsetting the food to the player hands is in the food script
				
				global.Currency-=20;
			}
			else if(two and player.current_food == noone and global.Currency >= 10)
			{				
				show_debug_message("Grabbed Potato");
				addFoodToPlayer(player, FOODS.Potato);
				
				// offsetting the food to the player hands is in the food script
				
				global.Currency-=40;
			}
			else if(three and player.current_food == noone and global.Currency >= 50)
			{
				show_debug_message("Grabbed Thyme");
				addFoodToPlayer(player, FOODS.Thyme);

				global.Currency-=50;
			}
		}
	}else
	{
		//set time dilation back to 1
		global.DilationFactor = 1;
		inShopMenu = false; 
	}
}