///@desc scr_grid_snap(Character, [Hard_Snap], [Draw_Grid])
///@param Character
///@param [Hard_Snap]-true
///@param [Draw_Grid]-false

var character = global.Selected;
if (argument_count > 0) character = argument[0];

var hardSnap = true;
if (argument_count > 1) hardSnap = argument[1];

var reDrawGrid = false;
if (argument_count > 2) reDrawGrid = argument[2];

with (character)
{
	// Find the centre of the closest cell
	var _x = ((floor(x / CELL_SIZE)) * CELL_SIZE) + OFFSET;
	var _y = ((floor(y / CELL_SIZE)) * CELL_SIZE) + OFFSET;
	
	// Backup x and y coords of closest cell
	var xx = x
	if (hardSnap) xx = _x
	var yy = y
	if (hardSnap) yy = _y

	// Move character away
	x = 0;
	y = 0;
	
	//Find entities in the square
	var entity = instance_position(_x, _y, obj_entity);
	
	// Move to the nearest cell
	if (entity == noone)
	{
		// Return character
		x = xx;
		y = yy;
		if (!hardSnap)
		{
		mp_grid_path(global.CombatGrid, global.Path, x, y, _x, _y, true);
		path_start(global.Path, combatSpd, path_action_stop, false);
		}
		global.Moving = reDrawGrid;
	}else
	{
		var dir = 0;
		var maxChecks = 320;
		
		for (var i = 1; i >= 0; i += 0.5)
		{
			for (var h = 0; h < floor(i); h++)
			{
				switch (dir)
				{
					case 0: _y += CELL_SIZE; break;
					case 1: _x -= CELL_SIZE; break;
					case 2: _y -= CELL_SIZE; break;
					case 3: _x += CELL_SIZE; break;
				}
				entity = instance_position(_x, _y, obj_entity)
				if (entity == noone)
				{
					// Return character
					x = xx;
					y = yy;
					if (!hardSnap)
					{
						mp_grid_path(global.CombatGrid, global.Path, x, y, _x, _y, true);
						path_start(global.Path, combatSpd, path_action_stop, false);
					}
					global.Moving = reDrawGrid;
					//Break loops
					i = -1;
				}
			}
			//Next Direction
			if (dir >= 3) dir = 0 else dir++;			
			
			// Hard kill
			if (i > maxChecks) break;
		}
	}
}