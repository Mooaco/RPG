///@desc scr_grid_find_closest_cell(cell_x, cell_y, Character, [Cell_Type]-Availble)
///@param x
///@param y
///@param Character
///@param [Cell_Type]


// Find the centre of the closest cell
var _x = ((floor(argument0 / CELL_SIZE)) * CELL_SIZE) + OFFSET;
var _y = ((floor(argument1 / CELL_SIZE)) * CELL_SIZE) + OFFSET;
var _character = argument2

var cellsToCheck = 8; // the 8 cells around the cell created
var cellsChecked = 0; 
var _dir = 0; // 0 = start scanning in the cell below and move clockwise
var cellType = obj_grid_cell_available;
if (argument_count > 2) cellType = argument[2];
var closestCell = noone;
var closestCellDist = 100000;
var tempPath = path_add();
var entity = false;

for (var i = 1; i >= 0; i += 0.5)
{
	for (var h = 0; h < floor(i); h++)
	{
		switch (_dir)
		{
			case 0: _y += CELL_SIZE; break;
			case 1: _x -= CELL_SIZE; break;
			case 2: _y -= CELL_SIZE; break;
			case 3: _x += CELL_SIZE; break;
		}
		entity = instance_position(_x, _y, cellType)
		if (entity != noone)
		{
			tempPath = mp_grid_path(global.CombatGrid, global.Path, character.x, character.y, _x, _y, true);
			if (path_get_length(tempPath) < closestCellDist)
			{
					closestCellDist = path_get_length(tempPath)
					closestCell = entity;
			}
		}
		cellsChecked += 1;
	}
	//Next Direction
	if (_dir >= 3) _dir = 0 else _dir++;			
	// Hard kill
	if (cellsChecked >= cellsToCheck) i = -1;
}

path_delete(tempPath);