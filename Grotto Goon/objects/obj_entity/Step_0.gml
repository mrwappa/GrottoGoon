/// @description Insert description here
// You can write your code in this editor
if(img_speed > 0)
{
	img_counter += img_speed*delta;//img_speed/SlowMo
	
	if(img_counter >= 1)
	{
		img_index++;
		img_counter = 0;
		if(img_index > image_number)
		{
			img_index = 0; 
		}	
	}
}
current_sprite = sprite_index;
if(previous_sprite != current_sprite)
{
	img_index = 0;
}
image_index = img_index; 