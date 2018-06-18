switch (obj_unlocked_camera.unlocked)
{
	case true: scr_camera_lock(obj_player); break;
	case false: scr_camera_unlock(); break;
}