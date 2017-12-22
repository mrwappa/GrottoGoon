/// @description
//player_movement();
player_movement_delta();
player_animation();
player_pickup_weapon();

if(keyboard_check(ord("V")))
{
	timeScale = 0.2;	
}
else
{
	timeScale = 1;	
}

timer_counter += delta;