/// @description
randomize();
projectile = instance_place(x,y,obj_projectile);

if(projectile)
{
	var dir = point_direction(x,y,projectile.x,projectile.y) - 180;
	knockback_x = lengthdir_x(projectile.knockback,dir);
	knockback_y = /*lengthdir_y(projectile.knockback,dir)*/irandom_range(-300,-380);
	with(projectile)
	{
		instance_destroy();	
	}
}

knockback_x = damp(knockback_x,0,1-0.99);
knockback_y = damp(knockback_y,0,1-0.99);

alpha_ememy_patroll(state_patroll);
alpha_ememy_chase(state_chase);
alpha_ememy_jump(state_jump);