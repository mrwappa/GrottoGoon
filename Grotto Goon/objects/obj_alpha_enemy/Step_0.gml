/// @description
x_speed = movement_speed;
y_speed = e_gravity;

if(entity_x_collision(x_speed*delta,obj_solid))
{
	x_speed = 0;
}
if(entity_y_collision(y_speed*delta,obj_solid))
{
	y_speed = 0;
}

x += x_speed*delta;
y += y_speed*delta;

event_inherited();