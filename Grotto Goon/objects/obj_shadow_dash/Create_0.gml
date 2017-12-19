/// @description
target = obj_player;

image_alpha = 0.55;
color = c_white;

if(instance_exists(target))
{
	sprite_index = target.sprite_index;
	image_index = target.image_index;
	image_xscale = target.image_xscale;
}
image_speed = 0;