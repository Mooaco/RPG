


/// Check if dead
if (hp <= 0) 
{
	global.ReDraw = true;
	instance_destroy();	
}

//Aggro player
if (!global.InCombat)
{
	if (distance_to_object(global.Selected) <= aggroRangePix && hostile)
	{
		global.EnterCombat = true;
		scr_pack_enter_combat(packID);
		scr_pack_enter_combat(global.Selected.packID);
	}
}

// Flip image to face selected
if (global.Selected.x < x) image_xscale = -1 else image_xscale = 1;