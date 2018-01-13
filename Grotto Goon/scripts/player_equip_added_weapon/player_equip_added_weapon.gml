if(object_is_ancestor(Weapon.object_index,obj_spear))
{
	with(hands)
	{
		current_state = hand_state.grabbing_spear;
	}
	with(ds_list_find_value(Weapons,current_weapon))
	{
		grabbable = false;
		//spear is not in correct position for 1 frame, so just don't draw it that frame
		/*visible = false;
		alarm[1] = 3;*/
		current_state = state_grabbed;
	}
}

if(object_is_ancestor(Weapon.object_index,obj_wand))
{
	with(hands)
	{
		current_state = hand_state.grabbing_wand;
	}
	with(ds_list_find_value(Weapons,current_weapon))
	{
		grabbable = false;
		//spear is not in correct position for 1 frame, so just don't draw it that frame
		/*visible = false;
		alarm[1] = 3;*/
		current_state = state_grabbed;
	}
}