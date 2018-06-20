/// @description Check for input


if (mouse_check_button_pressed(mb_left) && global.States == States.InCombat)
{
scr_move_combat(mouse_x,mouse_y,selected)
scr_snap_to_grid(obj_player);
}

if (global.States == States.InCombat)
{
	camera_set_view_target(view_camera[0], obj_unlocked_camera);
	scr_move_outofcombat(obj_player,obj_player.spd)
}