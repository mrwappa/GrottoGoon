/// @description
previous_sprite = sprite_index;
if(current_state == player_state.normal)
{
	player_movement_delta();
	player_pickup_weapon();
	camera_look();
}

if(current_state == player_state.rolling)
{
	player_rolling();
}
player_animation();

if(keyboard_check(ord("V")))
{
	timeScale = 0.15;
}
else
{
	timeScale = 1;	
}

timer_counter += delta;

x = clamp(x,0,room_width);
y = clamp(y,0,room_height);