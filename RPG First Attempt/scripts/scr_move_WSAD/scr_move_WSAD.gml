//scr_move_WSAD(character)

var _character = argument0;
var _speed = argument0.spd;
var camera_target = camera_get_view_target(view_camera[0]);
var maskOffset = 5;

if (obj_camera.unlocked == true) camera_set_view_target(view_camera[0],obj_camera)

// Keyboard Move Left
if (keyboard_check(vk_left) || keyboard_check(ord("A")))
{
	if (obj_camera.unlocked == true)
	{
		with (obj_camera) if (x - cameraSpd - (camera_get_view_width(view_camera[0]) / 2) > 0)
		{
			x -= cameraSpd;
		}
	}else
	{
		with (_character)
		{
			var newPos = x - spd - OFFSET
			// check if moving outside of the room
			if (newPos > 0)
			{
				// check for collision
				if ((instance_position(newPos, y - OFFSET + maskOffset, obj_entity) == noone) && (instance_position(newPos, y + OFFSET - maskOffset, obj_entity) == noone)) 
				{
					x -= spd;
				}
			}
		}
	}
}
	  
// Keyboard Move Right	  
if (keyboard_check(vk_right) || keyboard_check(ord("D")))
{
	if (obj_camera.unlocked == true)
	{
		with (obj_camera) if (x + cameraSpd  + (camera_get_view_width(view_camera[0]) / 2) < room_width) x += cameraSpd;
	}else
	{
		with (_character)
		{
			var newPos = x + spd + OFFSET
			// check if moving outside of the room
			if (newPos < room_width)
			{
				// check for collision
				if ((instance_position(newPos, y - OFFSET + maskOffset, obj_entity) == noone) && (instance_position(newPos, y + OFFSET - maskOffset, obj_entity) == noone)) 
				{
					x += spd;
				}
			}
		}
	}
}
	  
// Keyboard Move Up
if (keyboard_check(vk_up) || keyboard_check(ord("W")))
{
	if (obj_camera.unlocked == true)
	{
		with (obj_camera) if (y - cameraSpd - (camera_get_view_height(view_camera[0]) / 2) > 0) y -= cameraSpd;
	}else
	{
		with (_character)
		{
			var newPos = y - spd - OFFSET
			// check if moving outside of the room
			if (newPos > 0)
			{
				// check for collision
				if ((instance_position(x - OFFSET + maskOffset, newPos, obj_entity) == noone) && (instance_position(x + OFFSET - maskOffset, newPos, obj_entity) == noone)) 
				{
					y -= spd;
				}
			}
		}
	}
}
	  
// Keyboard Move Down
if (keyboard_check(vk_down) || keyboard_check(ord("S")))
{
	if (obj_camera.unlocked == true)
	{
		with (obj_camera) if (y + cameraSpd + (camera_get_view_height(view_camera[0]) / 2) < room_height) y += cameraSpd;
	}else
	{
		with (_character)
		{
			var newPos = y + spd + OFFSET
			// check if moving outside of the room
			if (newPos < room_height)
			{
				// check for collision
				if ((instance_position(x - OFFSET + maskOffset, newPos, obj_entity) == noone) && (instance_position(x + OFFSET - maskOffset, newPos, obj_entity) == noone)) 
				{
					y += spd;
				}
			}
		}
	}
}
   


//Test camera moving code
//camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) - cameraSpd, camera_get_view_y(view_camera[0]))

// Move to Mouse
if (mouse_check_button(mb_left) && !global.InCombat)
{
	if (mouse_x - OFFSET > _character.x) // Is mouse left of the character?
	{
		with (_character) if (x + spd  + OFFSET < room_width) x += spd;
		
	}else if (mouse_x + OFFSET < _character.x) // Is mouse right of the character?
	{
		with (_character) if (x - spd - OFFSET > 0) x -= spd;
	}
	
	if (mouse_y - OFFSET > _character.y) // Is mouse below the character?
	{
		with (_character) if (y + spd  + OFFSET < room_height) y += spd;
		
	}else if (mouse_y + OFFSET < _character.y) // Is mouse above the character
	{
		with (_character) if (y - spd - OFFSET > 0) y -= spd;
	}
}
