function addFoodToPlayer(player, selectedFood)
{
	if (selectedFood == FOODS.SaltAndPepper)
	{
		var salt_and_pepper = instance_create_layer(player.x, player.y, "food_layer", obj_food);
		salt_and_pepper.sprite_index = spr_SaltAndPepper;
				
		// Scale down to 50%
		salt_and_pepper.image_xscale = 0.5;
		salt_and_pepper.image_yscale = 0.5;
				
		player.current_food = salt_and_pepper;
	}
	else if (selectedFood == FOODS.Potato)
	{
		var potato = instance_create_layer(player.x, player.y, "food_layer", obj_food);
		potato.sprite_index = spr_Potato;
				
		// Scale down to 50%
		potato.image_xscale = 0.5;
		potato.image_yscale = 0.5;
				
		player.current_food = potato;
	}
	else if(selectedFood == FOODS.Thyme)
	{
		var thyme = instance_create_layer(player.x, player.y, "food_layer", obj_food);
		thyme.sprite_index = spr_Thyme;
				
		// Scale down to 50%
		thyme.image_xscale = 0.5;
		thyme.image_yscale = 0.5;
				
		player.current_food = thyme;
	}
}