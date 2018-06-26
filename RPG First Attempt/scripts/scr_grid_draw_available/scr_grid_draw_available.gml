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
	// destroy existing cells
	instance_destroy(obj_grid_cell_available);
	instance_destroy(obj_grid_cell_attackable);
	
	// clear blocked grid cells
	mp_grid_clear_all(global.CombatGrid);
	
	// add blocked grid cells
	with (obj_entity)
	{
		if (id != character.id)
		{
			mp_grid_add_cell(global.CombatGrid, floor(x / CELL_SIZE), floor(y / CELL_SIZE))
		}
	}
	
	// Block test walls
	with (obj_wall) mp_grid_add_cell(global.CombatGrid, floor(x / CELL_SIZE), floor(y / CELL_SIZE))

	// draw availble spaces
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
					if (path_get_length(global.Path) <= moveRemaining && path_get_length(global.Path) > OFFSET) 
					{
						var cell = instance_create_layer(h, v, "Grid", obj_grid_cell_available);
						scr_grid_draw_attackable_nearby(cell.x, cell.y);					
					}
				}
			}
		}
	}
	path_clear_points(global.Path);
}