/// @descriptions
if (keyboard_check_pressed(vk_escape))
{
    game_end();
}

if(keyboard_check_pressed(ord("R")))
{
	game_restart();
}


if(keyboard_check_pressed(vk_enter))
{
	event_user(TOGGLE_PAUSE);
}
