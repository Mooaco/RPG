///scr_character_startturn ([Character])
///@param [Character] This will default to obj_player

var character = global.Selected;
if (argument_count > 0) character = argument[0];

with (character)
{
	actions = maxActions;
	moveRemaining = combatSpdPix;
}

