///scr_camera_lock(character)

var _character = obj_player;
if (argument0 != noone) _character = argument0;
camera_set_view_target(view_camera[0], _character);
obj_unlocked_camera.unlocked = false;