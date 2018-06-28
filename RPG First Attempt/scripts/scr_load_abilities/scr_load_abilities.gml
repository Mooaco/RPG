///@desc scr_load_abilities([List]) loads all spells and abilities into the game

ini_open("datafiles/Abilities.ini");

var abilityNum = 1;
while(ini_section_exists(abilityNum)) 
{
	// Create new ability and add it to the map.
	var ability = instance_create_layer(0, 0, "instance_layer", obj_ability);
	
	// Add the data.
	ability.name = ini_read_string(abilityNum, "name", 0);
	if (ini_read_string(abilityNum, "range", 0) == "MELEE_RANGE") ability.range = MELEE_RANGE else ability.range = ini_read_real(abilityNum, "range", 0);
	ability.display = ini_read_string(abilityNum, "display", 0);
	ability.visualEffect = ini_read_string(abilityNum, "visualEffect", 0);
	ability.baseDamage = ini_read_real(abilityNum, "baseDamage", 0);
	ability.dotDamage = ini_read_real(abilityNum, "dotDamage", 0);
	ability.dotDuration = ini_read_real(abilityNum, "dotDuration", 0);
	ability.dotHeal = ini_read_real(abilityNum, "dotHeal", 0);
	ability.baseHealing = ini_read_real(abilityNum, "baseHealing", 0);
	ability.manaConsumed = ini_read_real(abilityNum, "manaConsumed", 0);

	// Add this ability into the map.
	ds_map_add(global.Abilities, ability.name, ability);

	abilityNum++;
}

ini_close();