/// @desc Enter/leave combat

// Enter combat
if (global.InCombat = false)
{
	global.InCombat = true;
	instance_create_layer(0,0,"Grid",obj_grid);
	scr_grid_snap(global.Selected, false, true);
	scr_camera_lock(false);
	scr_camera_jump_to_player();
	scr_destroy_followers()
}
else // Leave combat
{
	global.InCombat = false;
	instance_destroy(obj_grid);
	instance_destroy(obj_grid_cell);
	instance_destroy(obj_grid_cell_available);
	scr_camera_lock(global.Selected);
	instance_create_layer(global.Selected.x,global.Selected.y,"Followers",obj_follower);
}