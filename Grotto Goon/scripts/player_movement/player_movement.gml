var h_mov = k_right - k_left;

if(k_jump and grounded)
{
	jump_value = -9;
	sprite_index = spr_player_jump;
}

if(hold_k_jump)
{
	jump_value = lerp(jump_value,0,0.0010);
}
else
{
	jump_value = lerp(jump_value,0,0.0018);	
}
p_gravity += 0.07*delta;


if(k_dash and !dashing)
{
	dashing = true;
	alarm[0] = 80/delta;
	dash_value = 6;
}
dash_value = lerp(dash_value,0,0.1*delta);
var dash_power = dash_value *h_mov;

//acceleration
var movement_add = h_mov * acceleration * delta;
//restitution
var movement_sub = min(restitution*delta,abs(x_speed)) * sign(x_speed) * (h_mov == 0);
//apply speed
x_speed = clamp(x_speed + movement_add - movement_sub, -movement_speed,movement_speed)+dash_power;
y_speed = p_gravity + jump_value ;

//collision
if(entity_x_collision(x_speed,obj_solid))
{
	x_speed = 0;
	image_speed = 0;
	image_index = 0;
}
if(entity_y_collision(y_speed,obj_solid))
{
	sprite_index = spr_player_walk;
	y_speed = 0;
}
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

//facing direction of sprite
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
image_speed = abs(true_xspeed)/2;
if(image_speed == 0)
{
	image_index = 0;	
}
if(!grounded)
{
	image_speed = 0;	
}
true_xspeed = (x -xprevious)/delta;
true_yspeed = (y -yprevious)/delta;

x = clamp(x,0,room_width);
y = clamp(y,0,room_height);