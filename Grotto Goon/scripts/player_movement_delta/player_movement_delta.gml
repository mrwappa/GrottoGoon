var h_mov = k_right - k_left;

//jump
if(k_jump and grounded)
{
	jump_value = -500;
	sprite_index = spr_player_jump;
}


if(hold_k_jump)
{
	//using lerp in a delta_time environment is different and returns different
	//restults on every machine, this damp function fixes this
	jump_value = damp(jump_value,0,1-0.8);
}
else
{

	jump_value = damp(jump_value,0,1-0.98);
}
p_gravity += 380*delta;

//acceleration
movement_add = h_mov * acceleration * delta;

//restitution
movement_sub = min(restitution*delta,abs(x_speed)) * sign(x_speed) * (h_mov == 0);
//apply speed
x_speed = clamp(x_speed + movement_add - movement_sub, -movement_speed,movement_speed);
y_speed = p_gravity + jump_value;

//wall slide
if(!grounded and x_collision and y_speed > 0)
{
	jump_value = -100;
	p_gravity = 190;
	
	//dust effect
	dust_counter -= 1*delta;
	if(dust_counter <= 0)
	{
		if(k_left)
		{
			instance_create(x - sprite_width/4 * sign(image_xscale),y + irandom_range(-2,2),obj_dust);	
		}
		if(k_right)
		{
			instance_create(x + sprite_width/7 * sign(image_xscale),y + irandom_range(-2,2),obj_dust);
		}
		dust_counter = 0.005;
	}
	
}

//collision
x_collision = false;
if(entity_x_collision(x_speed*delta,obj_solid))
{
	x_collision = true;
	x_speed = 0;
	image_speed = 0;
	image_index = 0;
	
	//wall jump
	if(k_jump and !grounded)
	{
		jump_value = -500;
		sprite_index = spr_player_jump;
		x_collision = false;
	}
}
if(entity_y_collision(y_speed*delta,obj_solid))
{
	//
}


//crouch
if(k_crouch and grounded)
{
	movement_speed = 130;
	sprite_index = spr_player_crouch;		
}
else
{
	movement_speed = 168;	
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