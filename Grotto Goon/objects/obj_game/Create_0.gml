/// @descriptions
window_set_cursor(cr_none);
cursor_sprite = spr_cursor;

TOGGLE_PAUSE = 0;
paused_ = false;
pause_sprite_ = noone;

globalvar k_left;
globalvar k_right;
globalvar k_jump;
globalvar hold_k_jump;
globalvar release_k_jump;
globalvar k_crouch;
globalvar k_dash;
globalvar k_attack;

room_speed = 9999;
globalvar delta;
delta = 60/1000000*delta_time;//1