///scr_character_spawn(type, quantity, x, y, hostile)
///@param Type
///@param Quantity
///@param Spawn_x
///@param Spawn_y
///@param Hostile

var type = argument0;
var quantity = argument1;
var spawn_x = argument2;
var spawn_y = argument3;
var hostile = argument4;
var spawned = ds_list_create()

for (var i = 0; i <= quantity - 1; i++)
{
	var last = instance_create_layer(spawn_x + (i * CELL_SIZE),spawn_y,"Characters",obj_character);
	ds_list_add(spawned, last);
	scr_grid_snap(ds_list_find_value(spawned, i));
}