///@desc scr_pack_enter_combat(packID)
///@param PackID

var pID = argument0;

with (obj_character) if (packID == pID) inCombat = true;