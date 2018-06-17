var horizontalCells = floor(room_width / CELL_SIZE);
var verticalCells = floor(room_height / CELL_SIZE);
var moveRange = obj_combat.selected.spd * CELL_SIZE;

instance_destroy(obj_grid_cell_available);

with (obj_player)
{
	for (var h = 0; h < horizontalCells; h += 1)
	{
		for (var v = 0; v < verticalCells; v += 1)
		{
			// Find the difference between the testing cell and the characters x and y values
			var xx = sqr(x - (h * CELL_SIZE + OFFSET));
			var yy = sqr(y - (v * CELL_SIZE + OFFSET));
			
			// If variable is a negative number, make it positive
			if (xx < 0) xx = xx * -1;
			if (yy < 0) yy = yy * -1;
			
			// Find the distance between them diagonally
			var zz = sqrt(xx + yy);

			// If in movement range, mark cell as available
			if (zz < moveRange + (OFFSET / 2)) 
			{
				instance_create_layer(h * CELL_SIZE + OFFSET, v * CELL_SIZE + OFFSET, "Grid", obj_grid_cell_available);
			}
		}
	}
}