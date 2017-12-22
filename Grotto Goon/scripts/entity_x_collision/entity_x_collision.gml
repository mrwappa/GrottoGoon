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
		
		//wall slide
		if(!grounded and y_speed > 0)
		{
			jump_value = -150;
			p_gravity = 190;
	
			//dust effect
			dust_counter -= delta;
			if(dust_counter <= 0)
			{
				//makes sure that the y position of dust is clamped to the current bricks dimensions
				var dust_pos_y = clamp(y + irandom_range(-2,2),brickx.y - sprite_height/2,brickx.y + sprite_height/2);
				var dust_pos_y_1 = clamp(y - irandom_range(-2,2),brickx.y - sprite_height/2,brickx.y + sprite_height/2);
				if(k_left)
				{
					instance_create(brickx.x + brickx.sprite_width/2.2,dust_pos_y,obj_dust);	
				}
				if(k_right)
				{
					instance_create(brickx.x - brickx.sprite_width/1.8,dust_pos_y_1,obj_dust);
				}
				dust_counter = 0.01;
			}
	
		}
		return true;
	}	
}

return false;
