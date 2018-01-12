if(current_state == argument0)
{
	image_angle = 0;
	depth = -4;
	if(!grabbable)
	{
		color = c_white;
	}
	else
	{
		 color = mergecolor;
	}
	
	falling_speed += 200*delta;
	var block = instance_place(x,y + falling_speed*delta,obj_solid);
	if(block)
	{
		for(var i = 0; i < abs(falling_speed*delta); i++)
		{
			if(place_meeting(x,y+sign(falling_speed*delta),block)) then break;
				y+=sign(falling_speed)*delta;
			
		}

		falling_speed = 0;
	}
	y+=falling_speed*delta;
}