/// @description Creates variables & objects

#macro CELL_SIZE 42
#macro LEFT_OFFSET 0
#macro RIGHT_OFFSET 0
#macro OFFSET CELL_SIZE / 2
#macro MELEE_RANGE 1.5


global.CurrentZoom = 1;
global.CameraLock = false;
global.InCombat = false;
global.SpawnLocation_x = room_width / 2 + 100
global.SpawnLocation_y = room_height / 2
global.CombatGrid = mp_grid_create(LEFT_OFFSET,RIGHT_OFFSET,room_width/CELL_SIZE,room_height/CELL_SIZE,CELL_SIZE,CELL_SIZE);
global.Path = path_add();
global.Moving = false;
global.PlayersTurn = true;
global.Abilities = ds_list_create();
scr_load_abilities(global.Abilities);

instance_create_layer(global.SpawnLocation_x ,global.SpawnLocation_y, "Grid", obj_combat);
global.Selected = instance_create_layer(global.SpawnLocation_x ,global.SpawnLocation_y, "Player", obj_player);
instance_create_layer(global.SpawnLocation_x ,global.SpawnLocation_y, "Camera", obj_camera);

scr_character_spawn(obj_character, 3, 1250, 1000, true);
scr_camera_lock(true);
scr_camera_zoom(CameraClose);
