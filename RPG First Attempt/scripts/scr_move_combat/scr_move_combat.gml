///scr_move_combat(end_x,end_y,character)
///@param end_x
///@param end_y
///@param character

var end_x = argument0;
var end_y = argument1;
var character = argument2;

//Check the cell and character are valid
if (!global.Moving)
{
	if (character != -1) && (instance_position(end_x, end_y, obj_grid_cell_available))  
	{
		with (character)
		{
			// gets the cell object
			var cell = instance_position(end_x, end_y, obj_grid_cell_available);
			if (mp_grid_path(global.CombatGrid, global.Path, x, y, cell.x, cell.y, true))
			{

				// If character starts moving, use one of their actions
				if (moveRemaining == combatSpdPix)
				{
						actions--;
				}
				moveRemaining -= path_get_length(global.Path);
		
				instance_destroy(obj_grid_cell_available);
				path_start(global.Path, 3, path_action_stop, false);
				global.Moving = true;
		
				return true;
			}
		}
	}
}
return false;