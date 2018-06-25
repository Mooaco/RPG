///@desc scr_load_abilities([List]) loads all spells and abilities into the game

var list = argument[0];

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



// If the argument is not a valid list, create one;
if (!ds_exists(list, ds_type_list)) list = ds_list_create();

var length = 0;

while (length <= ds_list_size(abilityName) - 1)
{
	var tempName = abilityName[| length];
	var tempRange = abilityRange[| length];
	var tempEffect = abilityEffect[| length];
	var tempEffectValue = abilityEffectValue[| length];
	ds_list_add(list, scr_create_basic_ability(tempName, tempRange, tempEffect, tempEffectValue));
	length++;
}

