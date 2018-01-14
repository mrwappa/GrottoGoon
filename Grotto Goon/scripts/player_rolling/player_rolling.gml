img_speed = 20;

x_speed = roll_x_speed;
if(entity_x_collision(x_speed*delta,obj_solid))
{
	x_speed = 0;
}
roll_x_speed = damp(roll_x_speed,0,1-0.8);
if(hold_k_jump)
{
	jump_value = damp(jump_value,0,1-0.8);
}
else
{
	jump_value = damp(jump_value,0,1-0.995);
}

y_speed = p_gravity + jump_value;
player_y_collision(y_speed*delta,obj_solid);

p_gravity += 380*delta;


x += x_speed*delta;
y += y_speed*delta;

//exit to normal state
if(img_index == image_number)
{
	roll_x_speed = 0;
	var weapon = ds_list_find_value(Weapons,current_weapon);
	if(weapon != noone and !is_undefined(weapon))
	{
		with(weapon)
		{
			current_state = state_grabbed;
			visible = true;
		}
		with(hands)
		{
			current_state = other.previous_hand_state;
		}
	}
	current_state = player_state.normal;
	if(!grounded)
	{
		sprite_index = spr_player_jump;
	}
}	

//jump
if(k_jump and grounded and img_index > 1)
{
	jump_value = -500;//500
	sprite_index = spr_player_jump;
	var weapon = ds_list_find_value(Weapons,current_weapon);
	if(weapon != noone and !is_undefined(weapon))
	{
		with(weapon)
		{
			current_state = state_grabbed;
			visible = true;
		}
		with(hands)
		{
			current_state = other.previous_hand_state;
		}
	}
	current_state = player_state.normal;
}

//coordinate maths
true_xspeed = (x -xprevious)/delta;
true_yspeed = (y -yprevious)/delta;