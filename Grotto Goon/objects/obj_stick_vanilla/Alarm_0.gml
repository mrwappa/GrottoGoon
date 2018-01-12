/// @description

//check if it's inside a solid object and then move itself accordingly
var wall = instance_place(x,y,obj_solid);
if(wall)
{
	var y_distance = abs(y - wall.y + (wall.sprite_height/2));
	var x_distance = abs(x - wall.x + (wall.sprite_width/2));
	if(x >= wall.x + (wall.sprite_width/2))
	{
		x += x_distance/3;
	}
	else
	{
		x -= x_distance*1.4;
	}
	
}
if(wall)
{
	alarm[0] = 1;
	visible = false;
}
else
{
	visible = true;	
}
