///@desc scr_grid_draw_attackable_nearby(Cell_x, Cell_y, Other_Cell_Type_To_Draw)
///@param Cell_x
///@param Cell_y
///@param [Cell_Type]-Attackable

var cellsToCheck = 8; // the 8 cells around the cell created
var cellsChecked = 0; 
var _dir = Dir.Down; // the starting direction to check
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
			case Dir.Down: _y += CELL_SIZE; break;
			case Dir.Right: _x -= CELL_SIZE; break;
			case Dir.Up: _y -= CELL_SIZE; break;
			case Dir.Left: _x += CELL_SIZE; break;
		}
		
		if (!instance_position(_x, _y, obj_grid_cell_attackable))
		{
			var entity = instance_position(_x, _y, obj_entity)
			if (entity != noone && entity.id != global.Selected.id && entity.attackable && entity.hostile)
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