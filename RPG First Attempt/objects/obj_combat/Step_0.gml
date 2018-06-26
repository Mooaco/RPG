/// @description Check for input


// Left mouse pressed
if (mouse_check_button_pressed(mb_left) && global.InCombat)
{
	// Check if trying to move
	if (instance_position(mouse_x, mouse_y,obj_grid_cell_available))
	{
		scr_move_combat(mouse_x,mouse_y,global.Selected);
	
	// Check if trying to attack
	}else if (instance_position(mouse_x, mouse_y, obj_grid_cell_attackable))
	{
		if (instance_position(mouse_x, mouse_y, obj_grid_cell_attackable > global.Selected.attackRangePix))
		{
			var _cell = scr_grid_find_closest_cell(mouse_x, mouse_y, global.Selected);
			scr_move_combat(_cell.x, _cell.y, global.Selected);
			scr_character_attack(global.Selected.defaultAttackAbility, instance_position(mouse_x, mouse_y, obj_entity));
		}
		else
			scr_character_attack(global.Selected.defaultAttackAbility, instance_position(mouse_x, mouse_y, obj_entity));
	}
}

// Locks camera on player
if (global.InCombat)
{
	camera_set_view_target(view_camera[0], obj_camera);
	scr_move_outofcombat(global.Selected)
}

//Creates grid after moving
if (global.Moving == true)
{
	with (global.Selected) if (path_position == 1)
	{
		global.Moving = false;
		scr_grid_draw_available(global.Selected);
	}
}

//Highlight Cell
