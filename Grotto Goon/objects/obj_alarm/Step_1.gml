/// @description
timer -= 1*delta;
timer = max(timer,-1);

if(timer == -1 or timer > 0)
{
	trigger = false;
}
if(timer <= 0 and timer != -1)
{
	trigger = true;
	timer = -1;
}
