//if(x != xprevious)
{
	var brickx = instance_place(x + argument0,y,argument1);
	if(brickx)
	{
		for(var i = 0; i < abs(argument0); i++)
		{
			if(place_meeting(x+sign(argument0),y,brickx)) then break;
				x+=sign(argument0);
		}
	
		//makes player not stuck
		if(x > brickx.x and instance_place(x,y,argument1))
		{
			var p_difference = abs((x - sprite_width/2) - (brickx.x + brickx.sprite_width/2));
			if(p_difference > 0)
			{
				x+=sign(p_difference);
			}
		}
		else if(x <= brickx.x and instance_place(x,y,argument1))
		{
			var p_difference = abs((x + sprite_width/2) - (brickx.x - brickx.sprite_width/2));
			if(p_difference > 0)
			{
				x-=sign(p_difference);
			}  
		}
		return true;
	}	
}

return false;
