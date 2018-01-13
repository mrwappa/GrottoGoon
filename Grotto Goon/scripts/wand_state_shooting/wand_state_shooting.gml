if(current_state == argument0)
{
	shoot_time -= 1*delta;
	shoot_time = clamp(shoot_time,0,shoot_cooldown);
	if(instance_exists(target))
	{
		image_angle = point_direction(target.x,target.y,mouse_x,mouse_y);
		extra_length_x = lengthdir_x(12,image_angle);
		extra_length_y = lengthdir_y(12,image_angle);
		if(lunging and lunge_current_length >= lunge_max_length)
		{
			lunge_current_length += lunge_speed*delta;
			lunge_speed = damp(lunge_speed,-20,0.000001);
		}
		else if(lunge_current_length <= lunge_max_length)
		{
			lunging = false;	
		}
		
		if(!lunging)
		{
			lunge_current_length -= lunge_speed*delta;
			if(lunge_current_length >= 0)
			{
				lunging = true;
				x = target.x + lengthdir_x(lunge_current_length,image_angle) + extra_length_x;
				y = target.y + 4 + lengthdir_y(lunge_current_length,image_angle) + extra_length_y;
				current_state = spear_state.grabbed;
			}
		}
		x = target.x + lengthdir_x(lunge_current_length,image_angle) + extra_length_x;
		y = target.y + 4 + lengthdir_y(lunge_current_length,image_angle) + extra_length_y;

	}
}