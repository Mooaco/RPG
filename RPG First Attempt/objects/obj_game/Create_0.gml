#macro CELL_SIZE 42
#macro LEFT_OFFSET 0
#macro RIGHT_OFFSET 0
#macro OFFSET CELL_SIZE / 2
#macro MELEE_RANGE 1.5
#macro PLAYER_PACK_ID 1

global.CurrentZoom = 1;
global.ViewWidth = CameraDefaultWidth;
global.ViewHeight = CameraDefaultHeight;
global.CameraLock = false;
global.InCombat = false;
global.SpawnLocation_x = 220
global.SpawnLocation_y = 740
global.CombatGrid = mp_grid_create(LEFT_OFFSET,RIGHT_OFFSET,room_width/CELL_SIZE,room_height/CELL_SIZE,CELL_SIZE,CELL_SIZE);
global.Path = path_add();
global.Moving = false;
global.Attacking = false;
global.ReDraw = false;
global.PlayersTurn = true;
global.DamageDealt = 0;
global.Abilities = ds_map_create();
scr_load_ability();
global.Target = noone;
global.Selected = instance_create_layer(global.SpawnLocation_x ,global.SpawnLocation_y, "Player", obj_player);
instance_create_layer(global.SpawnLocation_x ,global.SpawnLocation_y, "Camera", obj_camera);
global.EnterCombat = false;
global.EndCombat = false;
global.NumHostiles = 0;
global.NumFriendlies = 0;
global.PackIDGen = 1;
global.InitiativeList = ds_list_create();

scr_character_spawn(obj_character, 3, 1250, 1000, true, true, 12);
scr_camera_lock(true);
scr_camera_zoom(CameraClose);