/// @desc Enter/leave combat

// Enter combat
if (global.States == States.OutOfCombat)
{
	global.States = States.InCombat;
	instance_create_layer(0,0,"Grid",obj_grid);
	scr_camera_unlock();
	scr_snap_to_grid(obj_player);
	scr_grid_draw_available();
}else
// Leave combat
{
	global.States = States.OutOfCombat;
	instance_destroy(obj_grid);
	instance_destroy(obj_grid_cell);
	instance_destroy(obj_grid_cell_available);
	scr_camera_lock(obj_player);
}