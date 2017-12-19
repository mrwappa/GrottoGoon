if(instance_exists(obj_weapon))
{
	
	//MAKE A DIALOGUE POP UP TELLING IF ITEM ALREADY EXISTS
	with(obj_weapon)
	{
		grabbable = false;
	}
	
	value = ds_list_find_value(Weapons,current_weapon);
	var same_item = false;
	
	//Find the nearest instance of weapon that isn't wielded by the player
	if(ds_list_size(Weapons) > 0)
	{
		for(var i=0; i < ds_list_size(Weapons);i++)
		{
			with(ds_list_find_value(Weapons,i))
			{
				x+=10000; 
			}	
		}
	}
	Weapon = instance_nearest(x,y,obj_weapon);
	if(ds_list_size(Weapons) > 0)
	{
		for(var i=0; i < ds_list_size(Weapons);i++)
		{
			with(ds_list_find_value(Weapons,i))
			{
				x-=10000; 
			}	
		}
	}
	
	if(point_distance(x,y,Weapon.x,Weapon.y) < 30 and Weapon.current_state == Weapon.state_idle)
	{
		with(Weapon)
		{
			grabbable = true;
		}
		
		
		if(keyboard_check_pressed(vk_shift) and Weapon.grabbable == true)
		{
			if(ds_list_size(Weapons > 0))
			{
				for(var i = 0; i < ds_list_size(Weapons); i++)
				{
					//check if object is the same
					//if true set the item_same variable to true
					if(ds_list_find_value(Weapons,i).object_index == Weapon.object_index)
					{
						same_item = true;
						break;
					}
				}	
			}
			
			if(same_item == false)
			{
				//found a bug where when i picked up a weapon, the previous weapon was
				//not set to inventory state
				for(var i = 0; i < ds_list_size(Weapons); i++)
				{
					value = ds_list_find_value(Weapons,i);
					value.current_state = value.state_inventory;
				}
				
				ds_list_add(Weapons,Weapon);
				current_weapon = ds_list_size(Weapons)-1;
				
				if(ds_list_size(Weapons) > 1)
				{
					value = ds_list_find_value(Weapons,current_weapon-1);
				
					with(value)
					{
						current_state = state_inventory;
					}
				}
				player_equip_added_weapon();
			}
			
		}
	}
	
	
	//DROP WEAPON
	if(keyboard_check_pressed(vk_control) and ds_list_size(Weapons) > 0)
	{
		if(ds_list_find_value(Weapons,current_weapon).current_state == ds_list_find_value(Weapons,current_weapon).state_grabbed)
		{
			value = ds_list_find_value(Weapons,current_weapon);
		
			with(value)
			{
				current_state = state_idle;
				x = other.x;
				y = other.y;
			}
			ds_list_delete(Weapons,current_weapon);
		
			if(ds_list_size(Weapons) == 0)
			{
				current_weapon = 0;
				with(hands)
				{
					current_state = state_idle;
				}
			}
			else if(ds_list_size(Weapons) > 0)
			{
				current_weapon -= 1;
				current_weapon = clamp(current_weapon,0,ds_list_size(Weapons)-1);
				value = ds_list_find_value(Weapons,current_weapon);
			
				player_equip_weapon();
			}
		}
		
	}
	
	if(ds_list_size(Weapons) > 0)
	{
		//SCROLL INVENTORY DOWN
		if(ds_list_find_value(Weapons,current_weapon).current_state == ds_list_find_value(Weapons,current_weapon).state_grabbed)
		{
			//if(instance_exists(Weapon))
			{
				if(mouse_wheel_down() and ds_list_size(Weapons) > 1)
				{
					if(current_weapon == 0)
					{
				
						current_weapon = ds_list_size(Weapons) -1;
						value = ds_list_find_value(Weapons,0);
				
						with(value)
						{
							current_state = state_inventory;
						}
				
					}
					else
					{
				
						current_weapon--;

						value = ds_list_find_value(Weapons,current_weapon+1);
				
						with(value)
						{
							current_state = state_inventory;
						}
				
					}
					value = ds_list_find_value(Weapons,current_weapon);
			
					player_equip_weapon();
				}
			}
		}
	
	
		//SCROLL INVENTORY UP
		if(ds_list_find_value(Weapons,current_weapon).current_state == ds_list_find_value(Weapons,current_weapon).state_grabbed)
		{
			//if(instance_exists(Weapon))
			{
				if(mouse_wheel_up() and ds_list_size(Weapons) > 1)
				{
					if(current_weapon == ds_list_size(Weapons) -1)
					{
						if(ds_list_find_value(Weapons,current_weapon).current_state == value.state_grabbed)
						{
							current_weapon = 0;
							value = ds_list_find_value(Weapons,ds_list_size(Weapons)-1);
							with(value)
							{
								current_state = state_inventory;
							}
						}
					}
					else
					{
						if(ds_list_find_value(Weapons,current_weapon).current_state == value.state_grabbed)
						{
							current_weapon++;	

							value = ds_list_find_value(Weapons,current_weapon-1);
				
							with(value)
							{
								current_state = state_inventory;
							}
						}
					}
					value = ds_list_find_value(Weapons,current_weapon);
			
					player_equip_weapon();	
				}
			}
		}
	}	
}


