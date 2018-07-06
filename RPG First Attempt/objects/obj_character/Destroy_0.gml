

// Reduce packsize if members are remaining otherwise end the combat
if (packSize < 1)
{
	scr_character_pack_death(packID);
}
else
{
	global.EndCombat = true;
}