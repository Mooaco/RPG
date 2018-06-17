//scr_move_outofcombat(character,speed)

var _character = argument0
var _speed = argument1
var camera_target = camera_get_view_target(view_camera[0])


// Keyboard Move Left
if (keyboard_check(vk_left) || keyboard_check(ord("A")))
{
	if (camera_target == obj_unlocked_camera)
	{
		with (obj_unlocked_camera) if (x - cameraSpd - (camera_get_view_width(view_camera[0]) / 2) > 0) x -= cameraSpd;
	}else
	{
		if (_character.x - spd - OFFSET > 0) _character.x -= spd;
	}
}
	  
// Keyboard Move Right	  
if (keyboard_check(vk_right) || keyboard_check(ord("D")))
{
	if (camera_target == obj_unlocked_camera)
	{
		with (obj_unlocked_camera) if (x + cameraSpd  + (camera_get_view_width(view_camera[0]) / 2) < room_width) x += cameraSpd;
	}else
	{
		if (_character.x + spd  + OFFSET < room_width) _character.x += spd;
	}
}
	  
// Keyboard Move Up
if (keyboard_check(vk_up) || keyboard_check(ord("W")))
{
	if (camera_target == obj_unlocked_camera)
	{
		with (obj_unlocked_camera) if (y - cameraSpd - (camera_get_view_height(view_camera[0]) / 2) > 0) y -= cameraSpd;
	}else
	{
		if (_character.y - spd - OFFSET > 0) _character.y -= spd;
	}
}
	  
// Keyboard Move Down
if (keyboard_check(vk_down) || keyboard_check(ord("S")))
{
		if (camera_target == obj_unlocked_camera)
		{
			with (obj_unlocked_camera) if (y + cameraSpd + (camera_get_view_height(view_camera[0]) / 2) < room_height) y += cameraSpd;
		}else
		{
			if (_character.y + spd  + OFFSET < room_height) _character.y += spd;
		}
}
   


//Test camera moving code
//camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) - cameraSpd, camera_get_view_y(view_camera[0]))

// Move to Mouse
if (mouse_check_button(mb_left))
{
	if (mouse_x - OFFSET > _character.x) // Is mouse left of the character?
	{
		if (_character.x + spd  + OFFSET < room_width) _character.x += spd;
		
	}else if (mouse_x + OFFSET < _character.x) // Is mouse right of the character?
	{
		if (_character.x - spd - OFFSET > 0) _character.x -= spd;
	}
	
	if (mouse_y - OFFSET > _character.y) // Is mouse below the character?
	{
		if (_character.y + spd  + OFFSET < room_height) _character.y += spd;
		
	}else if (mouse_y + OFFSET < _character.y) // Is mouse above the character
	{
		if (_character.y - spd - OFFSET > 0) _character.y -= spd;
	}
}