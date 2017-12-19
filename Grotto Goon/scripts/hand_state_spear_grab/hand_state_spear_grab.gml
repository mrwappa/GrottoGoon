if(current_state == hand_state.grabbing_spear)
{
	if(instance_exists(target))
	{
		if(instance_exists(target.Weapon))
		{
			x = target.Weapon.x - target.Weapon.extra_length_x;
			y = target.Weapon.y - target.Weapon.extra_length_y - 1;
			image_angle = target.Weapon.image_angle;
		}
	}
}