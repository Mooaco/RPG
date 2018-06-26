
instance_destroy(obj_grid_cell_highlighted);

if (!global.Moving)
{
	var _x = ((floor(mouse_x / CELL_SIZE)) * CELL_SIZE) + OFFSET;
	var _y = ((floor(mouse_y / CELL_SIZE)) * CELL_SIZE) + OFFSET;
	
	instance_create_layer(_x,_y,"Player",obj_grid_cell_highlighted);
}