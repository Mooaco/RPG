///scr_move_combat(end_x,end_y,character)
var end_x = argument0;
var end_y = argument1;
var character = argument2;

if (character != -1) with (character)
{
x = end_x
y = end_y
scr_snap_to_grid(character)
scr_grid_draw_available()
}



// add code to check is destination is available