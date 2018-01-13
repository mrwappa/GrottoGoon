if(current_state == hand_state.grabbing_wand)
{
	if(instance_exists(target))
	{
		var weapon = ds_list_find_value(target.Weapons,target.current_weapon);
		if(weapon != noone and !is_undefined(weapon))
		{
			x = weapon.x - weapon.extra_length_x;
			y = weapon.y - weapon.extra_length_y - 1;
			image_angle = weapon.image_angle;
		}
	}
}