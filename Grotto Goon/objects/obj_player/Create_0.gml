/// @description
timer_counter = 0;

//Appearance
color = c_white;
image_xscale = 1;
image_yscale = image_xscale;
image_speed = 0;
depth = 1;

img_index = 0;
img_speed = 0;
img_counter = 0;

hands = instance_create(x,y,obj_hands);
previous_hand_state = 0;

///movement
x_speed = 0;
y_speed = 0;
true_xspeed = 0;
true_yspeed = 0;
movement_add = 0;
movement_sub = 0;

movement_speed = 158;
acceleration = 4000;
restitution = 1700;

//dash
dash_value = 0;
dashing = false;

//jump
p_gravity = 180;
grounded = false;
jump_value = 0;

//roll
roll_x_speed = 0;

x_collision = false;

//alarm/counter stuff
dash_counter = -1;
shadow_counter = 0;

dust_counter = 0.01;

//list and value
Weapons = ds_list_create();
Weapon = noone;
value = noone;
current_weapon = 0;


enum player_state
{
	normal,
	rolling
}

current_state = player_state.normal;