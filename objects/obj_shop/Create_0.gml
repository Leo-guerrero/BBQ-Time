// CREATE EVENT

enum FOODS{
	SaltAndPepper,   // 1: more damage
	Potato,		     // 2: More Health/Time to BBQ
	Thyme,           // 3: Decrease Time Cooldown Duration
}

enum UPGRADES{
	Hot_N_Ready,   // A Hot Pocket: used for distracting zombies
	Stove_O_Roma,  // Stove: Shoots Food At Zombies
}

inShopMenu = false;

SelectedFood = FOODS.SaltAndPepper;

// --- GUI SETUP ---
// Define the desired resolution for your GUI layer (e.g., 800x800)
// This must be set somewhere, often in a game-setup object's Create event
// display_set_gui_size(800, 800); 

// --- BLACK BOX DIMENSIONS ---
// Define the size of the black square (the menu itself)
rect_w = 400; // Example: Half the size of the 800 canvas
rect_h = 400;

// --- CALCULATE CENTERED GUI POSITION ---
// Use the display functions to get the GUI size, which is fixed on the screen.
var gw = display_get_gui_width();  
var gh = display_get_gui_height();

// Calculate the top-left corner (gui_x, gui_y) needed to center the rect_w/h box
gui_x = (gw / 2) - (rect_w / 2);
gui_y = (gh / 2) - (rect_h / 2);