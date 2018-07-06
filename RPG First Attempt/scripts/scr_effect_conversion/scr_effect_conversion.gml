// @desc scr_effect_conversion(String)
// @param String

var _string = argument0;

switch (_string)
{
	case "Damage_Melee": return Effect.Damage_Melee; break;
	case "Damage_Ramge": return Effect.Damage_Range; break;
	case "Heal_Range": return Effect.Heal_Range; break;
}