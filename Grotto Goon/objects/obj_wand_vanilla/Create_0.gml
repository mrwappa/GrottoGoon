/// @description
alarm[0] = 1;
target = obj_player;

//Appearance
color = c_white;
mergecolor = merge_color(c_white,c_black,0.6);
depth = -1;

//Positioning
extra_length_x = lengthdir_x(25,image_angle);
extra_length_y = lengthdir_y(25,image_angle);
falling_speed = 200;

//Attack
lunge_speed = 340;
lunge_max_length = 32;
lunge_current_length = 0;
shooting = true;


//States
enum wand_state
{
	idle,
	grabbed, 
	inventory
}

current_state = wand_state.idle;

state_idle = wand_state.idle;
state_grabbed = wand_state.grabbed;
state_inventory = wand_state.inventory;

grabbable = false;