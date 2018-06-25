/// @description Check Input

// Check if its the players turn
if (global.PlayersTurn)
{
	// In combat key set
	if (global.InCombat)
	{
		if (keyboard_check_pressed(ord("E"))) 
		{
			scr_character_startturn(global.Selected);
			scr_grid_draw_available(global.Selected);
		}
	}

	// Out of combat key set
	if (!global.InCombat)
	{
		if (keyboard_check_pressed(vk_control)) scr_camera_lock(obj_camera.unlocked);
	}

	// All key sets
	scr_move_outofcombat(global.Selected)

}