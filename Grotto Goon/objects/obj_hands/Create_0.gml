/// @description
target = obj_player;

//Appearance
color = c_white;

enum hand_state
{
	idle,
	grabbing_spear,
	grabbing_flail,
	grabbing_chain
}

current_state = hand_state.idle;

state_idle = hand_state.idle;