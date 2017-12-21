/// @descriptions
draw_set_alpha(1);
draw_set_halign(fa_right);

draw_text(display_get_gui_width()-5, 160, obj_player.true_xspeed);

draw_text(display_get_gui_width()-5, 240, point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y));
draw_text(display_get_gui_width()-5, 280, obj_player.x_collision);

draw_text(display_get_gui_width()-5, 320, delta_time/1000000);
draw_text(display_get_gui_width()-5, 340, delta);

draw_text(display_get_gui_width()-5, 400, nmTest);