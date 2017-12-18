//if(y != yprevious)
{
	var bricky = instance_place(x,y + argument0,argument1);
	if(bricky)
	{
		for(var i = 0; i < abs(argument0); i++)
		{
			if(place_meeting(x,y+sign(argument0),bricky)) then break;
				y+=sign(argument0);

		}
		if(y > bricky.y and instance_place(x,y,argument1))
		{
			var p_difference = abs((y - sprite_height/2) - (bricky.y + bricky.sprite_height/2));
			if(p_difference > 0)
			{
				y+=sign(p_difference);
			}
		}
		else if(y <= bricky.y and instance_place(x,y,argument1))
		{
			var p_difference = abs((y + sprite_height/2) - (bricky.y - bricky.sprite_height/2));
			if(p_difference > 0)
			{
				y-=sign(p_difference);
			}  
		}
		if(bricky.y > y)
		{
			grounded = true;
			p_gravity = 2;
		}
		return true;
	}
}
grounded = false;
return false;