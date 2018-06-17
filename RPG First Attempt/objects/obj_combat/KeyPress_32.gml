/// @desc Enter Combat
show_message("Entering combat1")
if (global.States == States.OutOfCombat)
{
	global.States = States.InCombat;
	instance_create_layer(0,0,"Grid",obj_grid);
	camera_set_view_target(view_camera[0], obj_player);
	scr_snap_to_grid(obj_player)
	show_message("Entering combat2")
}else
{
	global.States = States.OutOfCombat;
	instance_destroy(obj_grid);
}