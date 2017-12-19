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
falling_speed = 3;

//Attack
lunge_speed = 7;
lunge_max_length = 32;
lunge_current_length = 0;
lunging = true;


//States
enum spear_state
{
	idle,
	grabbed,
	lunged, 
	inventory
}

current_state = spear_state.idle;

state_idle = spear_state.idle;
state_grabbed = spear_state.grabbed;

grabbable = false;