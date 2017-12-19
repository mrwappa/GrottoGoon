/// @description
gpu_set_blendmode(bm_subtract);
surface_set_target(light);

repeat(1)
{
	draw_ellipse_color(x - size / 2 - view_x ,y - size / 2 - view_y,
	x + size /2 - view_x, y + size / 2 - view_y, color,c_black,false);//c_orange , c_yellow
}

surface_reset_target();
gpu_set_blendmode(bm_normal);
