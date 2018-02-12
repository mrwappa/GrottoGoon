if(current_state = argument0)
{
	x_speed = movement_speed + knockback_x;
	y_speed = e_gravity + knockback_y;
	turn_timer -= 1*delta;
	if(entity_x_collision(x_speed*delta,obj_solid))
	{
		x_speed = 0;
		movement_speed*=-1;
	}
	
	if(entity_y_collision(y_speed*delta,obj_solid))
	{
		y_speed = 0;
		var block = collision_point(x + (sprite_width/2) * -1 ,y + sprite_height/2 + 8,obj_solid,false,true);
		if(!block and turn_timer <= 0)
		{
			turn_timer = 0.2;
			movement_speed*=-1;
		}
	}
	x += x_speed*delta;
	y += y_speed*delta;
	if(instance_exists(target))
	{
		var line_col = collision_line(x,y,target.x,target.y,obj_solid,false,true);
		var dist = point_distance(x,y,target.x,target.y);
		if(!line_col and dist < 120)
		{
			movement_speed = 95;
			current_state = state_chase;
		}
	}
	image_xscale = one_sign(x_speed) * -1;
	event_inherited();
}