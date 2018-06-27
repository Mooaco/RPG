/// @desc scr_rows_to_cells(Rows)
/// @param Rows

//var total = 1;

//for (var i = argument0; i <= 0; i--) total += i;

//return total * 8;

//calculates the number of cells in the rows around a given position
return (8 * (argument0 * (0.5 + (argument0 * 0.5))));