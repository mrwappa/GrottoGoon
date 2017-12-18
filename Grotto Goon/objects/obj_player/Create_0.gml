/// @description

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

//movement
x_speed = 0;
y_speed = 0;

dash_value = 0;
dashing = false;

jump_value = 0;
movement_speed = 3;
acceleration = 1;
restitution = 0.5;

true_xspeed = 0;
true_yspeed = 0;

p_gravity = 2;
grounded = false;