var character = argument0;

with (character)
{
	// Centre in closest grid cell
	x = (round((x-OFFSET)/CELL_SIZE)+0.5)*CELL_SIZE;
	y = (round((y-OFFSET/2)/CELL_SIZE)+0.5)*CELL_SIZE;
}