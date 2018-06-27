/// @description Check Input

// Check if its the players turn
if (global.PlayersTurn)
{
	/// IN COMBAT - INPUT ///
	if (global.InCombat)
	{
		// End character turn
		if (keyboard_check_pressed(ord("E"))) 
		{
			scr_character_startturn(global.Selected);
			scr_grid_draw_available(global.Selected);
		}
		
		// Left mouse pressed
		if (mouse_check_button_pressed(mb_left))
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
					var _cell = scr_grid_find_closest_free_cell(mouse_x, mouse_y, global.Selected);
					scr_move_combat(_cell.x, _cell.y, global.Selected);
					scr_character_attack(global.Selected.defaultAttackAbility, instance_position(mouse_x, mouse_y, obj_entity));
				}
				else
					scr_character_attack(global.Selected.defaultAttackAbility, instance_position(mouse_x, mouse_y, obj_entity));
			}
		}
		
		/// IN COMBAT - LOGIC ///
		
		//Creates grid after moving
		if (global.Moving == true)
		{
			with (global.Selected) if (path_position == 1)
			{
				global.Moving = false;
				scr_grid_draw_available(global.Selected);
			}
		}
	}

	// Out of combat key set
	if (!global.InCombat)
	{
		if (keyboard_check_pressed(vk_control)) scr_camera_lock(obj_camera.unlocked);
	}

	// All key sets
	scr_move_outofcombat(global.Selected);

	// Draw Highlighted
	scr_grid_draw_highlighted();
}