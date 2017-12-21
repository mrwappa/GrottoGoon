/// @description Insert description here
// You can write your code in this editor
if(turn)
{
	image_angle -= 8*delta;
}
else
{
	image_angle += 8*delta;
}

image_xscale -= 8*delta;
//image_alpha -= 0.1*delta;
image_yscale = image_xscale;

if(image_xscale <= 0 or image_alpha <= 0)
{
	instance_destroy();	
}