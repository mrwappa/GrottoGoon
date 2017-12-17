/// @descriptions
zoom_ = false;
view_zoom_extra = 1;
view_zoom=1;

screenshake = 0;

ideal_width = 0;
ideal_height = 270;//540
corresponding_width = 480;//960

globalvar display_width;
globalvar display_height;

display_width=display_get_width();
display_height=display_get_height();

aspect_ratio=display_width/display_height;

ideal_width=round(ideal_height*aspect_ratio); 
//ideal_height=round(ideal_width / aspect_ratio);

//Perfect Pixel Scaling
if(display_width mod ideal_width != 0)
{
  var d = round(display_width/ideal_width);
  ideal_width=display_width/d;
}
if(display_height mod ideal_height != 0)
{
  var d = round(display_height/ideal_height);
  ideal_height=display_height/d;
}

//Check for odd numbers
if(ideal_width & 1)
{
	ideal_width++;
}
if(ideal_height &  1)
{
	ideal_height++;
}
width_difference = abs(ideal_width/corresponding_width);

//Calculate Max Zoom
max_zoom=floor(display_width/ideal_width)-1;

window_set_size(display_width,display_height);

surface_resize(application_surface,ideal_width/width_difference,ideal_height/width_difference);
  
alarm[0]=1; //This will center the window after the initial resizing.

camera = camera_create();
globalvar view_x,view_y,view_w,view_h;
view_x = 0;
view_y = 0;
view_w = ideal_width/width_difference;
view_h = ideal_height/width_difference;
view_max_zoom=view_w/view_h;
max_zoom_pan = view_h/view_w;
display_set_gui_size(display_width/2,display_height/2);

globalvar display_scale;
globalvar gui_mouse_x;
globalvar gui_mouse_y;

display_scale = (display_get_gui_width()/view_w);
gui_mouse_x = (mouse_x - view_x)*display_scale;
gui_mouse_y = (mouse_y - view_y)*display_scale;

FollowObject = obj_player;

room_goto_next();
