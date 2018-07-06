///scr_character_spawn(type, quantity, x, y, hostile, attackable, hp)
///@param Type
///@param Quantity
///@param Spawn_x
///@param Spawn_y
///@param Hostile
///@param Attackable
///@param hp

var type = argument0;
var quantity = argument1;
var spawn_x = argument2;
var spawn_y = argument3;
var hostile = argument4;
var attackable = argument5
var hp = argument6
var spawned = ds_list_create()

for (var i = 0; i <= quantity - 1; i++)
{
	var last = instance_create_layer(spawn_x + (i * CELL_SIZE),spawn_y,"Characters",obj_character);
	ds_list_add(spawned, last);
	scr_grid_snap(last);
	last.hostile = hostile;
	last.attackable = attackable;
	last.hp = hp;
	last.maxHp = hp;
	last.packSize = quantity;
	last.packID = global.PackIDGen
}

global.PackIDGen += 1;