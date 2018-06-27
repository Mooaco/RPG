///@desc scr_character_attack(Ability, Target, [Attacker]-global.Selected)
/// @param Ability
/// @param Target
/// @param [Attacker]

var ability = argument[0];
ability = ds_map_find_value(global.Abilities, ability)
var target = argument[1];
var attacker = global.Selected;
if (argument_count > 2) attacker = argument[2];


switch (ability.effect[| 0])
{
	case Effect.Basic_Damage:
	target.hp -= ability.effectValue[| 0];
	global.DamageDealt = ability.effectValue[| 0];
	break;
	case Effect.Basic_Range:
	target.hp -= ability.effectValue[| 0];
	global.DamageDealt = ability.effectValue[| 0];
	break;
	case Effect.Basic_Heal: 
	if (target.hp + ability.effectValue[| 0] > target.maxHp) 
	{
		target.hp = target.maxHp
	}
	else target.hp += ability.effectValue[| 0];
	break
}

// Create floating combat text
if (global.DamageDealt > 0) var txt_obj = instance_create_layer(target.x,target.y,"Text",obj_floating_combat_text);
//txt_obj.text = string(global.DamageDealt);
//global.DamageDealt = 0;