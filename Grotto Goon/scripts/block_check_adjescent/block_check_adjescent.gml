randomize();

var right = instance_position(x + sprite_width,y,obj_block);
var left = instance_position(x - sprite_width,y,obj_block);
var up = instance_position(x,y - sprite_height,obj_block);
var down = instance_position(x,y + sprite_height,obj_block);
	
if(left and right and down and !up)
{
	sprite_index = spr_blockU;
}
else if(left and right and !down and up)
{
	sprite_index = spr_blockD;
}
else if(!left and right and down and up)
{
	sprite_index = spr_blockL;
}
else if(left and !right and down and up)
{
	sprite_index = spr_blockR;
}
else if(!left and !right and !down and !up)
{
	sprite_index = spr_blockFILLED;
}
else if(left and right and down and up)
{
	sprite_index = spr_blockBLANK;
}
else if(left and !right and !down and !up)
{
	sprite_index = spr_blockURD;
}
else if(!left and right and !down and !up)
{
	sprite_index = spr_blockUDL;
}
else if(left and right and !down and !up)
{
	sprite_index = spr_blockUD;
	image_xscale = choose(1,-1);
}
else if(!left and right and down and !up)
{
	sprite_index = spr_blockUL;
}
else if(left and !right and down and !up)
{
	sprite_index = spr_blockUR;
}
else if(!left and !right and down and !up)
{
	sprite_index = spr_blockURL;
}
else if(!left and !right and down and up)
{
	sprite_index = spr_blockLR;
}
else if(left and !right and !down and up)
{
	sprite_index = spr_blockDR;
}
else if(!left and right and !down and up)
{
	sprite_index = spr_blockDL;
}
else if(!left and !right and !down and up)
{
	sprite_index = spr_blockRDL;
}