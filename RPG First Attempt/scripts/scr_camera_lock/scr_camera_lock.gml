/// @param {Boolean} Enabled
/// @param [Character]

var enabled = argument[0];
if (enabled != true && enabled != false) enabled = obj_camera.unlocked;

var character = global.Selected;
if(argument_count > 1) character = argument[1];

if (enabled == true)
{
	camera_set_view_target(view_camera[0], character);
	obj_camera.unlocked = false;
	
}else
{
	scr_camera_jump_to_player()
	with (obj_camera)
	{
		// Checks if camera is already unlocked
		if (obj_camera.unlocked == false)
		{
			// Checks if the player is too close to the left boundary
			if (x < (camera_get_view_width(view_camera[0]) / 2))
			{
				obj_camera.x = camera_get_view_width(view_camera[0]) / 2;
			// Checks if the player is too close to the right boundary
			}else if (x > (room_width - (camera_get_view_width(view_camera[0]) / 2)))
			{
				obj_camera.x = room_width - (camera_get_view_width(view_camera[0]) / 2);
			}else
			{
				obj_camera.x = x;
			}
	
			// Checks if the player is too close to the top boundary
			if (y < (camera_get_view_height(view_camera[0]) / 2))
			{
				obj_camera.y = camera_get_view_height(view_camera[0]) / 2;
			// Checks if the player is too close to the bottom boundary
			}else if (y > (room_height - (camera_get_view_height(view_camera[0]) / 2)))
			{
				obj_camera.y = room_height - (camera_get_view_height(view_camera[0]) / 2);
			}else
			{
				obj_camera.y = y;
			}

			camera_set_view_target(view_camera[0], obj_camera);
		}
	}

	obj_camera.unlocked = true;
}