if(object_is_ancestor(value.object_index,obj_spear))
{
	with(hands)
	{
		current_state = hand_state.grabbing_spear;
						
	}
	with(value)
	{
		grabbable = false;
		current_state = state_grabbed;
		visible = true;
		//alarm[1] = 2;
	}
}

if(object_is_ancestor(value.object_index,obj_wand))
{
	with(hands)
	{
		current_state = hand_state.grabbing_wand;
						
	}
	with(value)
	{
		grabbable = false;
		current_state = state_grabbed;
		visible = true;
		//alarm[1] = 2;
	}
}