var horizontalCells = floor(room_width / CELL_SIZE);
var verticalCells = floor(room_height / CELL_SIZE);



for (var h = 0; h < horizontalCells; h += 1)
{
	for (var v = 0; v < verticalCells; v += 1)
	{
		instance_create_layer(h * CELL_SIZE + OFFSET, v * CELL_SIZE + OFFSET, "Grid", obj_grid_cell);
	}
}