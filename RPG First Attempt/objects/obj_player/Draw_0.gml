/// @desc Debug Draw

draw_self()

if (global.States == States.InCombat)
{
	var MarginFromTop = y + 40
	var HorizontalCentre = x-100

	draw_set_colour(c_white);
	// Draw actions remaining
	draw_text(HorizontalCentre, MarginFromTop, "Actions remaining " + string(maxActions-actions) )
	// Draw movement remaining at mouse
	if (instance_position(mouse_x, mouse_y, obj_grid_cell) != noone) 
	{
		var cell = instance_position(mouse_x, mouse_y, obj_grid_cell);
		draw_text(mouse_x + 10, mouse_y, string(round(scr_pythagoras(x, y, cell.x, cell.y))) + " of " + string(moveRemaining + (OFFSET / 2)));
	}
}

//draw_text(HorizontalCentre, MarginFromTop + 80, "M_X: " + string(mouse_x) + " | Y: " + string(mouse_y))
