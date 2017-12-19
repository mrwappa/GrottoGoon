/// @description
if (!surface_exists(light))
{
    light = surface_create(view_w,view_h);
}
surface_set_target(light);

draw_set_color(color);//c_ltgray , c_white , c_gray , color
draw_rectangle(0,0,view_w,view_h,false);

surface_reset_target();