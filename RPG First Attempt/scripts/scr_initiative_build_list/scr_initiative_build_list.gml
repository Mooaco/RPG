///@desc scr_initiative_build_list()

with (obj_character)
{
	if (inCombat)
		{
		if (ds_list_empty(global.InitiativeList)) 
		{
			ds_list_add(global.InitiativeList, id);
		}
		else
		{
			var listSize = ds_list_size(global.InitiativeList)
			for (var i = 0; i < listSize; i++)
			{
				if (initiative > global.InitiativeList[| i].initiative) 
				{
					ds_list_insert(global.InitiativeList, i, id);
					i = listSize;
				}
			}
		}
	}
}

ds_list_destroy(global.InitiativeList);