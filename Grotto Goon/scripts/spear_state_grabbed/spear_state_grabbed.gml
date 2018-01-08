if(current_state == argument0)
{
	depth = -1;
	color = c_white;
	
	if(instance_exists(target))
	{
		image_angle = point_direction(target.x,target.y,mouse_x,mouse_y);
		extra_length_x = lengthdir_x(12,image_angle);
		extra_length_y = lengthdir_y(12,image_angle);
		
		x = target.x + extra_length_x;
		y = target.y + 4 + extra_length_y - round(target.image_index / 2);
		image_yscale = sign(target.image_xscale);
		
		if(mouse_check_button_pressed(mb_left))
		{
			current_state = argument1;
		}
	}
}