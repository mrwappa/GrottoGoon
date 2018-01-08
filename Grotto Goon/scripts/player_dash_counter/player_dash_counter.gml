dash_counter-=1*delta;
if(dash_counter < 0 and dash_counter != -1)
{
	dashing = false;
}
if(dash_counter < 0)
{
	dash_counter = -1;
}

if(dashing)
{
	if(true_xspeed > movement_speed*1.1 or true_xspeed < -movement_speed*1.1)
	{
		shadow_counter -= 1*delta;
		if(shadow_counter <= 0)
		{
			shadow_counter = 0.12;
			instance_create(x,y,obj_shadow_dash);
		}	
	}
	
}