/// @desc Debug Draw

draw_self()

if (global.InCombat)
{
	var MarginFromTop = y + 20
	var HorizontalCentre = x - 5

	// Draw actions remaining
	draw_set_colour(c_black);
	draw_text(HorizontalCentre+2, MarginFromTop+2, string(actions))
	draw_set_colour(c_white);
	draw_text(HorizontalCentre, MarginFromTop, string(actions))
	
	// Draw movement remaining at mouse
	if (instance_position(mouse_x, mouse_y, obj_grid_cell_available) != noone) 
	{
		var cell = instance_position(mouse_x, mouse_y, obj_grid_cell);
		var percent = round(scr_pythagoras(x, y, cell.x, cell.y)) / moveRemaining * 100;
		var actionPoints = 0;
		if (round(percent / 100) < 1) actionPoints = 1 else actionPoints = round(percent / 100);
		draw_text(cell.x + OFFSET, cell.y + OFFSET, string(actionPoints) + " action");
	}
	else if (instance_position(mouse_x, mouse_y, obj_grid_cell_attackable) != noone) 
	{
		
		var cell = instance_position(mouse_x, mouse_y, obj_grid_cell);
		if (scr_pythagoras(x,y,cell.x,cell.y) <= attackRangePix)
		{
			var actionPoints = 1;
			draw_text(cell.x + OFFSET, cell.y + OFFSET, string(actionPoints) + " action");
		}
		else
		{
			var percent = round(scr_pythagoras(x, y, cell.x, cell.y) - CELL_SIZE) / moveRemaining * 100;
			var actionPoints = 1;
			if (round(percent / 100) < 1) actionPoints += 1 else actionPoints += round(percent / 100);
			draw_text(cell.x + OFFSET, cell.y + OFFSET, string(actionPoints) + " action");
		}
	}
}

//draw_text(HorizontalCentre, MarginFromTop + 80, "M_X: " + string(mouse_x) + " | Y: " + string(mouse_y))