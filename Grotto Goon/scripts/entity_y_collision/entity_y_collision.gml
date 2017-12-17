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