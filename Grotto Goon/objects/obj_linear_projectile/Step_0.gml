/// @description Insert description here
// You can write your code in this editor
x+=lengthdir_x(_speed*delta,_dir);
y+=lengthdir_y(_speed*delta,_dir);

if(instance_place(x,y,obj_solid) and !collision)
{
	alarm_1.timer = 0.01;
	collision = true;
}
if(x - sprite_width > room_width or x + sprite_width < 0)
{ 
	instance_destroy();
}
if(y - sprite_height > room_height or y + sprite_height < 0)
{
	instance_destroy();
}

if(alarm_1.trigger)
{
	instance_destroy(alarm_1.id);
	instance_destroy();	
}