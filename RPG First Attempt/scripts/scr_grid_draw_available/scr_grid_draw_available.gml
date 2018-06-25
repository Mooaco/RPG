///@desc scr_grid_draw_available(character, [x], [y])
///@param Character
///@param [x]
///@param [y]

var character = argument[0]
var manuel = false;
var _x = character.x;
var _y = character.y;
if (argument_count > 2) 
{
	manuel = true;
	_x = argument[1];
	_y = argument[2];
}


if (!global.Moving)
{
	instance_destroy(obj_grid_cell_available);
	instance_destroy(obj_grid_cell_attackable);
	mp_grid_clear_all(global.CombatGrid);
	
	with (obj_entity)
	{
		if (id != character.id)
		{
			mp_grid_add_cell(global.CombatGrid, floor(x / CELL_SIZE), floor(y / CELL_SIZE))
		}
	}

	with (character)
	{
		for (var h = OFFSET; h < room_width; h += CELL_SIZE)
		{
			for (var v = OFFSET; v < room_height; v += CELL_SIZE)
			{
				// Record any entity's on the cell
				var entity = instance_position(h, v, obj_entity)
				
				// If in movement range, mark cell as available
				if (mp_grid_path(global.CombatGrid, global.Path, character.x, character.y, h, v, true))
				{
					if (path_get_length(global.Path) <= moveRemaining) 
					{
						instance_create_layer(h, v, "Grid", obj_grid_cell_available);
					}
				
				// Check if entity in cell can be attacked and is not the player calling it
				}else if (entity != noone && entity.id != character.id)
					{
						// Check if entity is attackable and in range of the character
						if (entity.attackable && scr_pythagoras(x,y,entity.x,entity.y) <= character.attackRangePix)
						{
							instance_create_layer(h, v, "Grid", obj_grid_cell_attackable);
						}
					}
			}
		}
	}
	path_clear_points(global.Path);
}