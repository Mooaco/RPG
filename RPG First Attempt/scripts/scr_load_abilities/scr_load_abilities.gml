///@desc scr_load_abilities([List]) loads all spells and abilities into the game

var map = argument[0];

var abilityName = ds_list_create();
var abilityRange = ds_list_create();
var abilityEffect = ds_list_create();
var abilityEffectValue = ds_list_create();

ds_list_add(abilityName, "Melee");
ds_list_add(abilityRange, MELEE_RANGE);
ds_list_add(abilityEffect, Effect.Basic_Damage);
ds_list_add(abilityEffectValue, 4);

ds_list_add(abilityName, "Shoot");
ds_list_add(abilityRange, 8);
ds_list_add(abilityEffect, Effect.Basic_Damage);
ds_list_add(abilityEffectValue, 3);

ds_list_add(abilityName, "Heal");
ds_list_add(abilityRange, 3);
ds_list_add(abilityEffect, Effect.Basic_Heal);
ds_list_add(abilityEffectValue, 5);


// If the argument is not a valid map, create one;
if (!ds_exists(map, ds_type_map)) map = ds_map_create();


// this unpacks the list into the map
var length = 0;
while (length <= ds_list_size(abilityName) - 1)
{
	var tempName = abilityName[| length];
	var tempRange = abilityRange[| length];
	var tempEffect = abilityEffect[| length];
	var tempEffectValue = abilityEffectValue[| length];
	ds_map_add(map, tempName, scr_create_basic_ability(tempName, tempRange, tempEffect, tempEffectValue));
	length++;
}

// Loading from Ini file
var abilities = ds_map_create();

ini_open("resources/Abilities.ini");

var abilityNum = 0;
while(ini_section_exists(abilityNum)) {
	// Create new ability and add it to the map.
	var ability = instance_create_layer(0, 0, "instance_layer", obj_ability);

	// Add the data.
	ability.name = ini_read_real(abilityNum, "name", 0);
	ability.range = ini_read_real(abilityNum, "range", 0);
	ability.display = ini_read_real(abilityNum, "display", 0);
	ability.visualEffect = ini_read_real(abilityNum, "visualEffect", 0);
	ability.baseDamage = ini_read_real(abilityNum, "baseDamage", 0);
	ability.dotDamage = ini_read_real(abilityNum, "dotDamage", 0);
	ability.dotDuration = ini_read_real(abilityNum, "dotDuration", 0);
	ability.dotHeal = ini_read_real(abilityNum, "dotHeal", 0);
	ability.baseHealing = ini_read_real(abilityNum, "baseHealing", 0);
	ability.manaConsumed = ini_read_real(abilityNum, "manaConsumed", 0);

	// Add this ability into the map.
	ds_map_add(abilities, abilityNum, ability);

	abilityNum++;
}

ini_close();
