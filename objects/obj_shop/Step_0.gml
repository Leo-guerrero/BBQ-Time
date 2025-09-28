
var player = instance_find(obj_player, 0); 

//player exists
if(player != noone){ 
	
	//player close to shop
	if(distance_to_point(player.x, player.y) < 20)
	{
		if(keyboard_check_pressed(ord("E")) and !inShopMenu)
		{
			inShopMenu = true;
			dilation_changed = true;
			global.DilationFactor = 0.5;
		}
		
		if(inShopMenu)
		{
			var one = keyboard_check_pressed(ord("1"));
			var two = keyboard_check_pressed(ord("2"));
			var three = keyboard_check_pressed(ord("3"));
		
			// salt and pepper
			if(one){
				// increase player damage
				//with(obj_player)
				//{
					//no implemneted yet
				//}
			}
			//Potato
			else if(two)
			{
				with(obj_bbq)
				{
					obj_bbq.hp += 10;
					obj_bbq.hp = min(obj_bbq.hp, 50);
				}
			}
	
			// Thyme 
			else if(three)
			{
				global.TimeStopCoolDownDuration = max(5, global.TimeStopCoolDownDuration-1)  
				global.TimeStopDuration += 1
			}
		}
	}else
	{
		//set time dilation back to 1
		if (dilation_changed) {
			dilation_changed = false;
			global.DilationFactor = 1;
		}
		inShopMenu = false; 
	}
}