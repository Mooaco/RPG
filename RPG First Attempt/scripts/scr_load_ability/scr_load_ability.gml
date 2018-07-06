///@desc scr_load_ability() loads all spells and abilities into the game

ini_open("Abilities.ini");

var abilityNum = 1;

while(ini_section_exists(abilityNum)) 
{
	// Create new ability and add it to the map.
	var ability = instance_create_layer(0, 0, "Abilities", obj_ability);
	
	with (ability)
	{
		// Add the data.
		name = ini_read_string(abilityNum, "name", 0);
		if (ini_read_string(abilityNum, "range", 0) == "MELEE_RANGE") range = MELEE_RANGE else range = ini_read_real(abilityNum, "range", 0);
		display = ini_read_string(abilityNum, "display", 0);
		visualEffect = ini_read_string(abilityNum, "visualEffect", 0);
	
		//for (var i = ds_list_size(effect); i <= 0; i--)
		//{
			ds_list_insert(effect, 0, scr_effect_conversion(ini_read_string(abilityNum, "effect", 0)));
			ds_list_insert(effectValue, 0, ini_read_real(abilityNum, "effectValue", 0));
			ds_list_insert(effectDuration, 0, ini_read_real(abilityNum, "effectDuration", 0))
		//}

		ability.baseDamage = ini_read_real(abilityNum, "baseDamage", 0);
		ability.dotDamage = ini_read_real(abilityNum, "dotDamage", 0);
		ability.dotDuration = ini_read_real(abilityNum, "dotDuration", 0);
		ability.dotHeal = ini_read_real(abilityNum, "dotHeal", 0);
		ability.baseHealing = ini_read_real(abilityNum, "baseHealing", 0);
		ability.manaConsumed = ini_read_real(abilityNum, "manaConsumed", 0);

		// Add this ability into the map.
		ds_map_add(global.Abilities, ability.name, ability);
	}

	abilityNum++;
}

ini_close();