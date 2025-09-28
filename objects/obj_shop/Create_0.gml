enum FOODS{
	SaltAndPepper,   // more damage
	Potato,		     // Health
	Onion,           // Boomerang //bad breath(flavor text)
	Thyme,           // Time
}

isShopping = false;

currentSelectedFood = ""

// 1st ability 
abilities = ["slowdown"]

gui_width = 100;
gui_height = 100;

xyValue = display_get_gui_width() / 2;
gui_x = xyValue / 2;
gui_y = xyValue / 2;