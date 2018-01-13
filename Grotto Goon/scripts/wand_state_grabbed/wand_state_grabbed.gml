if(current_state == argument0)
{
	shoot_time -= 1*delta;
	shoot_time = clamp(shoot_time,0,shoot_cooldown);
	depth = -1;
	color = c_white;
	
	if(instance_exists(target))
	{
		image_angle = point_direction(target.x,target.y,mouse_x,mouse_y);
		extra_length_x = lengthdir_x(12,image_angle);
		extra_length_y = lengthdir_y(12,image_angle);
		
		x = target.x + extra_length_x;
		y = target.y + 4 + extra_length_y - round(target.image_index / 2);
		image_yscale = sign(target.image_xscale);
		if(k_attack and shoot_time == 0)
		{
			var projectile = instance_create(x + lengthdir_x(sprite_width/2.5,image_angle),
			y + lengthdir_y(sprite_width/2.5,image_angle),obj_linear_projectile);
			with(projectile)
			{
				_dir = other.image_angle;
				image_angle = _dir;
				_speed = 400;
				sprite_index = other.projectile_sprite;
			}
			shoot_time = shoot_cooldown;
			knockback_speed = 100;
			lunge_speed = -280;
			current_state = wand_state.shooting;
		}
	}
}