/// @description
event_inherited();
//Appearance
image_xscale = 1;
image_yscale = image_xscale;
depth = -1;
color = c_white;
//Movement
x_speed = 0;
y_speed = 0;

movement_speed = 40;
e_gravity = 250;
jump_value = 0;

turn_timer = 0;

img_speed = 12;
target = obj_player;

enum alpha_enemy_state
{
	patroll,
	chase,
	jump
}
state_patroll = alpha_enemy_state.patroll;
state_chase = alpha_enemy_state.chase
state_jump = alpha_enemy_state.jump;

current_state = state_patroll;


