///scr_grid_draw_available(character)

var character = argument0
var horizontalCells = floor(room_width / CELL_SIZE);
var verticalCells = floor(room_height / CELL_SIZE);

instance_destroy(obj_grid_cell_available);

with (character)
{
	for (var h = 0; h < horizontalCells; h += 1)
	{
		for (var v = 0; v < verticalCells; v += 1)
		{
			var zz = scr_pythagoras(x, y, h * CELL_SIZE + OFFSET, v * CELL_SIZE + OFFSET);

			// If in movement range, mark cell as available
			if (zz < character.moveRemaining + (OFFSET / 2) && zz > OFFSET) 
			{
				instance_create_layer(h * CELL_SIZE + OFFSET, v * CELL_SIZE + OFFSET, "Grid", obj_grid_cell_available);
			}
		}
	}
}