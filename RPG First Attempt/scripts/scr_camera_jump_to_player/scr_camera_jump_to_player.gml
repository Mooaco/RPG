///scr_camera_jump_to_player([Character])
/// @param [Character]

var character = obj_player;
if (argument_count > 0) character = argument[0];

obj_camera.x = character.x;
obj_camera.y = character.y;