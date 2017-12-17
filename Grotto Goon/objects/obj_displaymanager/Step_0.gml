/// @descriptions

var zoom_speed = .01; //0.1 is the default

/*if(view_zoom_extra == 1)
{
	if(keyboard_check_pressed(vk_down))
	{
		view_zoom -= 162/4/view_w;
		zooming = true;
		

	}
	else if(keyboard_check_pressed(vk_up))
	{
		view_zoom += 162/4/view_w;
		zooming =  false;
	}
}
*/

//view_zoom = SlowMo/2 + 0.5;

view_zoom=clamp(view_zoom,max_zoom_pan,view_max_zoom);

view_w = round(ideal_width/view_zoom/view_zoom_extra/width_difference);
view_h = round(ideal_height/view_zoom/view_zoom_extra/width_difference);

