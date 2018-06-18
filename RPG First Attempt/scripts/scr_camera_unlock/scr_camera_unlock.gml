
var _character = obj_player;
if (camera_get_view_target(view_camera[0]) != noone) _character = camera_get_view_target(view_camera[0]);

with (_character)
{
	// Checks if camera is already unlocked
	if (camera_get_view_target(view_camera[0]) != obj_unlocked_camera)
	{
		// Checks if the player is too close to the left boundary
		if (x < (camera_get_view_width(view_camera[0]) / 2))
		{
			obj_unlocked_camera.x = camera_get_view_width(view_camera[0]) / 2;
		
		// Checks if the player is too close to the right boundary
		}else if (x > (room_width - (camera_get_view_width(view_camera[0]) / 2)))
		{
			obj_unlocked_camera.x = room_width - (camera_get_view_width(view_camera[0]) / 2);
		}else
		{
			obj_unlocked_camera.x = x;
		}
	
		// Checks if the player is too close to the top boundary
		if (y < (camera_get_view_height(view_camera[0]) / 2))
		{
			obj_unlocked_camera.y = camera_get_view_height(view_camera[0]) / 2;
		
		// Checks if the player is too close to the bottom boundary
		}else if (y > (room_height - (camera_get_view_height(view_camera[0]) / 2)))
		{
			obj_unlocked_camera.y = room_height - (camera_get_view_height(view_camera[0]) / 2);
		}else
		{
			obj_unlocked_camera.y = y;
		}

		camera_set_view_target(view_camera[0], obj_unlocked_camera);
	}
}

obj_unlocked_camera.unlocked = true;