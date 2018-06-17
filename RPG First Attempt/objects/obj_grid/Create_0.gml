/// @description Create the grid
#macro CELL_SIZE 42
#macro LEFT_OFFSET 0
#macro RIGHT_OFFSET 0
#macro OFFSET 21

global.combat_grid = mp_grid_create(LEFT_OFFSET,RIGHT_OFFSET,room_width/CELL_SIZE,room_height/CELL_SIZE,CELL_SIZE,CELL_SIZE);