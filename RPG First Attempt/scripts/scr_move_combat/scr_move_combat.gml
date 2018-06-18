///scr_move_combat(end_x,end_y,character)
var end_x = argument0;
var end_y = argument1;
var character = argument2;

//Check the cell and character are valid
if (character != -1) && (instance_position(end_x, end_y, obj_grid_cell_available))  
{
	with (character)
	{
		// gets the cell object
		var cell = instance_position(end_x, end_y, obj_grid_cell_available);
		var zz = scr_pythagoras(x, y, cell.x, cell.y);
		character.moveRemaining -= zz;
		x = cell.x;
		y = cell.y;
		scr_snap_to_grid(character);
		scr_grid_draw_available(character);
		return zz;
	}
}else return false;

