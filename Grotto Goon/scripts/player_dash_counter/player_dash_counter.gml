dash_counter-=1*delta;
if(dash_counter < 0 and dash_counter != -1)
{
	dashing = false;
}
if(dash_counter < 0)
{
	dash_counter = -1;
}	