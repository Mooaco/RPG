/// @description Check Input

// Check if its the players turn
if (global.PlayersTurn)
{
	
	/// IN COMBAT - INPUT ///
	
	// Check if leaving Combat
	if (global.EndCombat)
	{
		global.EndCombat = false;
		global.InCombat = false;
		instance_destroy(obj_grid);
		instance_destroy(obj_grid_cell);
		instance_destroy(obj_grid_cell_available);
		instance_destroy(obj_init_tracker)
		instance_destroy(obj_init_tracker_controller)
		scr_camera_lock(global.Selected);
		instance_create_layer(global.Selected.x,global.Selected.y,"Followers",obj_follower);
		scr_character_leave_combat_all()
		
	}
	
	if (global.InCombat)
	{
		// End character turn
		if (keyboard_check_pressed(ord("E"))) 
		{
			scr_character_startturn(global.Selected);
			scr_grid_draw_available(global.Selected);
			scr_initiative_update_trackers();
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
				global.Target = instance_position(mouse_x, mouse_y, obj_entity);
				
				// If out of range move closer then attack (requires 2 action points)
				if (scr_pythagoras(global.Target.x,global.Target.y, global.Selected.x, global.Selected.y) > global.Selected.attackRangePix)
				{
					if (global.Selected.actions >= 2)
					{
					var _cell = scr_grid_find_closest_free_cell(global.Target.x, global.Target.y);
					scr_move_combat(_cell.x, _cell.y, global.Selected);
					global.Attacking = true;
					}
					
				}// Else if in range then attack (requires 1 action points)
				else if (global.Selected.actions >= 1) 
				{
					global.Attacking = true;
				}
			}
		}
		
		/// IN COMBAT - LOGIC ///
		
		// Creates grid after moving
		if (global.Moving == true)
		{
			with (global.Selected) if (path_position == 1)
			{
				global.Moving = false;
				scr_grid_draw_available(global.Selected);
			}
		}
		
		// Uses basic attack if not moving
		if (global.Attacking)
		{
			if (!global.Moving)
			{
				global.Attacking = false;
				scr_character_attack(global.Selected.defaultAttackAbility, global.Target);
				global.Selected.actions--;
				scr_grid_draw_available(global.Selected);
			}
		}
		
		// Force redraw grid
		if (global.ReDraw)
		{
			scr_grid_draw_available(global.Selected);
			global.ReDraw = false;
		}
	}



	if (!global.InCombat)
	{
		/// OUT OF COMBAT - INPUT ///
		if (keyboard_check_pressed(vk_control)) scr_camera_lock(obj_camera.unlocked);
		
		
		
		
		/// OUT OF COMBAT - LOGIC ///
		
		// Enter combat
		if (global.EnterCombat == true)
		{
			global.InCombat = true;
			global.EnterCombat = false;
			scr_initiative_build_list();
			instance_create_layer(0,0,"Grid",obj_grid);
			instance_create_layer(0,0,"Text",obj_init_tracker_controller);
			scr_grid_snap(global.Selected, false, true);
			scr_camera_lock(false);
			scr_camera_jump_to_player();
			scr_destroy_followers()
			global.NumFriendlies = 1;
			global.NumHostiles = 3;
		}
	}

	// All key sets
	scr_move_WSAD(global.Selected);


	
	// Draw Highlighted
	scr_grid_draw_highlighted();
	
	// Check to see if on trigger square
	with (global.Selected)
	{
		if (place_meeting(x, y, obj_trigger) == true)
		{
				//trigger
				x = 1590;
				y = 920;
		}
	}
}

	/// EVERYONE OUT OF COMBAT - LOGIC ///