/// @description Update

if (updateTrackerPos)
{
	if (instance_exists(obj_init_tracker)) with (obj_init_tracker) instance_destroy();
	for (var i = 0; i <= maxCharactersShowable; i++)
	{
		scr_initiative_create_tracker(global.InitiativeList[| i])
	}
	updateTrackerPos = false;
}

if (updateScreenPos)
{
	scr_initiative_controller_screen_setup(id);
	updateScreenPos = false;
}