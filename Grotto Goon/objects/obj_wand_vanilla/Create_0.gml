/// @description
alarm[0] = 1;
target = obj_player;

//Appearance
color = c_white;
mergecolor = merge_color(c_white,c_black,0.6);
depth = -1;
projectile_sprite = spr_vanilla_projectile;

//Positioning
extra_length_x = lengthdir_x(25,image_angle);
extra_length_y = lengthdir_y(25,image_angle);
falling_speed = 200;

//Attack
lunge_speed = -280;
lunge_max_length = -10;
lunge_current_length = 0;
lunging = true;

shoot_time = 0;
shoot_cooldown = 0.3;

//States
enum wand_state
{
	idle,
	grabbed, 
	inventory,
	shooting
}

current_state = wand_state.idle;

state_idle = wand_state.idle;
state_grabbed = wand_state.grabbed;
state_shooting = wand_state.shooting;
state_inventory = wand_state.inventory;

grabbable = false;