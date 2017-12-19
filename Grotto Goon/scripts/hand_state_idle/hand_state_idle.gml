if(current_state == hand_state.idle)
{
	image_angle = 0;
	if(instance_exists(target))
	{
		x = target.x + sign(target.image_xscale);
		y = target.y + 3 - round(target.image_index / 2);

		image_xscale = sign(target.image_xscale);
		//image_angle = point_direction(target.x,target.y,mouse_x,mouse_y);
	}
}

