///scr_create_basic_ability(Name, Effect1, Effect1_Value, [Effect2], [Effect2_Value]... [Effect7])
///@param Name
///@param Range
///@param Effect1
///@param Effect1_value
///@param [Effect2]
///@param [Effect2_value]
///@param [Effect3]
///@param [Effect3_value]
///@param ...[Effect7_value]

var ability = instance_create_layer(0,0,"Abilities",obj_ability);

ability.name = argument[0];
ability.range = argument[1];
ability.numEffects = floor((argument_count - 2) / 2);

for (var i = argument_count-2; i >= 2; i -= 2)
{
	ds_list_insert(ability.effect, 0, argument[i]);
}

for (var v = argument_count-1; v >= 3; v -= 2)
{
	ds_list_insert(ability.effectValue, 0, argument[i]);
}

return ability;