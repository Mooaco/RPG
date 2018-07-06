///@desc scr_character_attack(Ability, Target, [Attacker]-global.Selected)
/// @param Ability
/// @param Target
/// @param [Attacker]

var tempAbility = argument[0];
var ability = noone;
if ds_map_exists(global.Abilities, tempAbility) 
{
	tempAbility = ds_map_find_value(global.Abilities, tempAbility);
	with (tempAbility) ability = instance_copy(false);
}
var target = argument[1];
var attacker = global.Selected;
if (argument_count > 2) attacker = argument[2];


with (ability)
{

	x = attacker.x;
	y = attacker.y;
	var tempEffect = effect[| 0];
	
	switch (tempEffect)
	{
		case Effect.Damage_Melee:
		target.hp -= effectValue[| 0];
		global.DamageDealt = effectValue[| 0];
		break;
		
		case Effect.Damage_Range:
		target.hp -= effectValue[| 0];
		global.DamageDealt = effectValue[| 0];
		// create sprite and movement
		sprite_index = spr_arrow;
		direction = point_direction(x, y, target.x, target.y);
		direction = direction + random_range(-1,1) - 45;
		speed = 10;
		image_angle = direction;
		break;
		
		case Effect.Heal_Range: 
		if (target.hp + effectValue[| 0] > target.maxHp) 
		{
			target.hp = target.maxHp
		}
		else target.hp += effectValue[| 0];
		break
	}
}

// Create floating combat text

//if (global.DamageDealt > 0) 
//{
	var floatingText = instance_create_layer(target.x,target.y,"Text",obj_floating_combat_text);
	floatingText.text = global.DamageDealt;
//}

//txt_obj.text = string(global.DamageDealt);
//global.DamageDealt = 0;