/// @description
//player_movement();
if(current_state == player_state.normal)
{
	player_movement_delta();
}

if(current_state == player_state.rolling)
{
	player_rolling();
}

player_animation();
player_pickup_weapon();
camera_look();
if(keyboard_check(ord("V")))
{
	timeScale = 0.2;	
}
else
{
	timeScale = 1;	
}

timer_counter += delta;

x = clamp(x,0,room_width);
y = clamp(y,0,room_height);