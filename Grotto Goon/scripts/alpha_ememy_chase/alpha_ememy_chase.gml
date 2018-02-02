if(current_state = argument0)
{
	var dir = point_direction(x,y,target.x,target.y);
	if(dir > 90 and dir < 270)
	{
		image_xscale = 1;
	}
	else
	{
		image_xscale = -1;
	}
	
	x_speed = movement_speed * image_xscale*(-1);
	y_speed = e_gravity;
	if(entity_x_collision(x_speed*delta,obj_solid))
	{
		x_speed = 0;
	}
	if(entity_x_collision(x_speed*delta, obj_player))
	{
		x_speed = 0;
	}
	if(entity_y_collision(y_speed*delta,obj_solid))
	{
		y_speed = 0;
		var block = instance_place(x + (sprite_width/2)*-1,y,obj_solid)
		if(block)
		{
			jump_value = 600;
			current_state = state_jump;
		}
		var block = collision_point(x + (sprite_width/2) * -1 ,y + sprite_height/2 + 8,obj_solid,false,true);
		if(!block)
		{
			var delta_y = abs(target.y - y);
			if(target.grounded and target.y < y and delta_y > 5)
			{
				jump_value = 600;
				current_state = state_jump;
			}
			if(!target.grounded and target.y < y - target.sprite_height*1.5)
			{
				jump_value = 600;
				current_state = state_jump;
			}
			if(target.y >= y and delta_y < target.sprite_height and target.grounded)
			{
				jump_value = 600;
				current_state = state_jump;
			}
		}
	}
	
	var delta_x = abs(target.x - x);
	if(delta_x > abs(x_speed*delta))
	{
		x += x_speed*delta;
	}
	y += y_speed*delta;
	
	
	event_inherited();
}