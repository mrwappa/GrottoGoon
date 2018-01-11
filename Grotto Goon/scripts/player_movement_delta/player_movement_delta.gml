randomize(); 
var h_mov = k_right - k_left;

//jump
if(k_jump and grounded)
{
	jump_value = -500;//500
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
	jump_value = damp(jump_value,0,1-0.995);
}
p_gravity += 380*delta;


//dash
/*if(k_dash and !dashing and x_speed != 0)
{
	dashing = true;
	dash_counter = 1;
	dash_value = 400;
	shadow_counter = 0.12;
}

player_dash_counter();

dash_value = damp(dash_value,0,1-0.989);
var dash_power = dash_value *h_mov;
*/


//acceleration
movement_add = h_mov * acceleration * delta;

//restitution
movement_sub = min(restitution*delta,abs(x_speed)) * sign(x_speed) * (h_mov == 0);
//apply speed
x_speed = clamp(x_speed + movement_add - movement_sub, -movement_speed,movement_speed) + roll_x_speed //+ dash_power;
y_speed = p_gravity + jump_value;


//collision
x_collision = false;
if(player_x_collision(x_speed*delta,obj_solid))
{
	x_collision = true;
	x_speed = 0;
	//img_speed = 0;
	image_index = 0;
	
	//wall jump
	if(k_jump and !grounded)
	{
		jump_value = -450;
		sprite_index = spr_player_jump;
		x_collision = false;
	}
}
if(player_y_collision(y_speed*delta,obj_solid))
{
	//
}


//crouch
if(k_crouch and grounded)
{
	movement_speed = 80;
	sprite_index = spr_player_crouch;		
}
else
{
	movement_speed = 150;
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

//roll
if(k_dash and h_mov != 0)
{
	if(ds_list_find_index(Weapons,Weapon) != -1)
	{
		with(Weapon)
		{
			current_state = state_inventory;			
		}
		previous_hand_state = hands.current_state;
		with(hands)
		{
			current_state = state_idle;	
		}
	}
	
	sprite_index = spr_player_roll;
	image_xscale = h_mov;
	roll_x_speed = h_mov * 400;
	current_state = player_state.rolling;
}
roll_x_speed = damp(roll_x_speed,0,1-0.95);
if(roll_x_speed < 0 and h_mov == 1)
{
	roll_x_speed = 0;	
}
if(roll_x_speed > 0 and h_mov == -1)
{
	roll_x_speed = 0;
}

//animation speed
img_speed = abs(true_xspeed)/10;

if(img_speed < 0.1)//img_speed == 0
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

