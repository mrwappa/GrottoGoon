var h_mov = k_right - k_left;

//jump
if(k_jump and grounded)
{
	jump_value = -10.3;
	sprite_index = spr_player_jump;
}

if(hold_k_jump)
{
	//lerp gets totally different results even if you apply: * delta.
	//this is a temporary workaround to make sure it returns somewhat same value on all machines
	//can try the power(procent,delta) workaround as well
	jump_value = lerp(jump_value,0,0.049*delta + fps_real/100000000);
	//jump_value = damp(jump_value,0,0.049/1000);
}
else
{
	jump_value = lerp(jump_value,0,0.15*delta + fps_real/100000000);
	//jump_value = damp(jump_value,0,0.15/1000);
}
p_gravity += 0.14*delta;


//dash
if(k_dash and !dashing and x_speed != 0)
{
	dashing = true;
	dash_counter = 60;
	dash_value = 8;
	shadow_counter = 0.12*60;
}

player_dash_counter();

dash_value = lerp(dash_value,0,0.1*delta+ fps_real/100000000);
var dash_power = dash_value *h_mov;

//acceleration
movement_add = h_mov * acceleration * delta;

//restitution
movement_sub = min(restitution*delta,abs(x_speed)) * sign(x_speed) * (h_mov == 0);
//apply speed
x_speed = clamp(x_speed + movement_add - movement_sub, -movement_speed,movement_speed)+dash_power;
y_speed = p_gravity + jump_value;

//wall slide
if(!grounded and x_collision and true_yspeed > 0)
{
	y_speed = 1;
	p_gravity = 3.5;
	//implement wall jump
	if(k_jump)
	{
		
	}
}

//collision
x_collision = false;
if(entity_x_collision(x_speed,obj_solid))
{
	x_collision = true;
	x_speed = 0;
	image_speed = 0;
	image_index = 0;
}
if(entity_y_collision(y_speed,obj_solid))
{
	//
}


//crouch
if(k_crouch and grounded)
{
	movement_speed = 2;
	sprite_index = spr_player_crouch;		
}
else
{
	movement_speed = 3;	
}

//move
x+=x_speed*delta;
y+=y_speed*delta;

//facing direction of the sprite
facing_dir = point_direction(x,y,mouse_x,mouse_y);
if(facing_dir > 90 and facing_dir < 270)
{
	image_xscale = -1;
}
else
{
	image_xscale = 1;
}

//animation speed
img_speed = abs(true_xspeed)/10;

if(img_speed == 0)
{
	img_index = 0;	
}
if(!grounded)
{
	img_index = 0;
	img_speed = 0;
}

//coordinate maths
true_xspeed = (x -xprevious)/delta;
true_yspeed = (y -yprevious)/delta;

x = clamp(x,0,room_width);
y = clamp(y,0,room_height);