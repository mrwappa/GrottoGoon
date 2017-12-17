/// @descriptions
/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(1);
draw_set_font(f_square);

if(paused_)
{
	draw_rectangle_color(0,0,display_get_gui_width(),display_get_gui_height(),
	c_black,c_black,c_black,c_black,false);
	var string_ = "paused";
	var string_h = string_height(string_);
	var string_w = string_width(string_);
	draw_text(display_get_gui_width()/2 + string_w/2,
	display_get_gui_height()/2 + string_h/2,string_);
}

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(5,5,display_write_specs(display.screen)+"\n"+
              display_write_specs(display.window)+"\n"+
              display_write_specs(display.app_surface)+"\n"+
              display_write_specs(display.view)+"\n"+
              display_write_specs(display.gui)
              );

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text(display_get_gui_width()-5, display_get_gui_height() -30, "FPS_REAL = " + string(floor(fps_real)));
draw_text(display_get_gui_width()-5, display_get_gui_height() -50, "FPS = " + string(floor(fps_real)));
draw_text(display_get_gui_width()-5, display_get_gui_height() -90, room_speed);

draw_text(display_get_gui_width()-5, display_get_gui_height() -5, "Bottom Right");

