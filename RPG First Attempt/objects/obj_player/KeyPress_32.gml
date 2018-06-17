/// @desc Enter Combat
if (global.States != States.InCombat)
{
	instance_create_layer(0,0,"Grid",obj_grid);

	global.States = States.InCombat;


	
	camera_set_view_target(view_camera[0], obj_player);
}else
{
	instance_destroy(obj_grid);
	global.States = States.OutOfCombat;
}