if(k_up and grounded)
{
	view_y_look = damp(view_y_look,-20,1-0.997);
}
else if(k_crouch and grounded)
{
	view_y_look = damp(view_y_look,20,1-0.997);
}
else if(!k_crouch and !k_up or !grounded)
{
	view_y_look = damp(view_y_look,0,1-0.9999);	
}