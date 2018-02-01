if(current_state = argument0)
{
	x_speed = movement_speed * image_xscale*(-1);
	y_speed = e_gravity - jump_value;
	
	jump_value = damp(jump_value,0,1-0.95);
	
	if(entity_x_collision(x_speed*delta,obj_solid))
	{
		x_speed = 0;
	}
	if(entity_y_collision(y_speed*delta,obj_solid))
	{
		y_speed = 0;
		jump_value = 0;
		current_state = state_chase;
	}
	
	x += x_speed*delta;
	y += y_speed*delta;
}