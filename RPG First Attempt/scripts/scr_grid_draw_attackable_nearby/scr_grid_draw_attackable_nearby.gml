///@desc scr_grid_draw_attackable_nearby(Cell_x, Cell_y, Other_Cell_Type_To_Draw)
///@param Cell_x
///@param Cell_y
///@param [Cell_Type]-Attackable

var cellsToCheck = 8; // the 8 cells around the cell created
var cellsChecked = 0; 
var _dir = 0; // 0 = start scanning in the cell below and move clockwise
var _x = argument[0];
var _y = argument[1];
var cellType = obj_grid_cell_attackable
if (argument_count > 2) cellType = argument[2];

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
		var entity = instance_position(_x, _y, obj_entity)

		if (!instance_position(_x, _y, obj_grid_cell_attackable))
		{
			if (entity != noone && entity.id != global.Selected.id && entity.attackable)
			{
				instance_create_layer(_x, _y, "Grid", cellType);
			}
		}
		cellsChecked += 1;
	}
	//Next Direction
	if (_dir >= 3) _dir = 0 else _dir++;			
	// Hard kill
	if (cellsChecked >= cellsToCheck) i = -1;
}