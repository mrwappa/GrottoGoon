if(current_state = argument0)
{
	x_speed = movement_speed;
	y_speed = e_gravity;
	if(entity_x_collision(x_speed*delta,obj_solid))
	{
		x_speed = 0;
		movement_speed*=-1;
	}
	else
	{
		var block = collision_point(x + sprite_width * one_sign(movement_speed),y + sprite_height /2 + 8,obj_solid,false,true);
		if(!block)
		{
			movement_speed*=-1;
		}
	}
	
	if(entity_y_collision(y_speed*delta,obj_solid))
	{
		y_speed = 0;
	}

	x += x_speed*delta;
	y += y_speed*delta;

	event_inherited();
}