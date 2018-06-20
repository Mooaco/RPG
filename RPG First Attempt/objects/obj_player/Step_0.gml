/// @description Out of Combat Movement

if (global.States == States.OutOfCombat)
{
	scr_move_outofcombat(obj_player,obj_player.spd)
}

if (endTurn)
{
	actions = 0;
	moveRemaining = spd * CELL_SIZE;
	scr_grid_draw_available(self);
	endTurn = false;
}

if (moveRemaining < (OFFSET + OFFSET / 2) && actions < maxActions)
{
	actions++;
	moveRemaining = spd * CELL_SIZE;
	scr_grid_draw_available(self);
}

// Move all variables down the array by 1
for (var i = histroySize; i > 0; i -= 1)
{
	xMoveHistory[i] = xMoveHistory[i-1]
	yMoveHistory[i] = yMoveHistory[i-1]
}
	
xMoveHistory[0] = x
yMoveHistory[0] = y
	
	
	
	
	
	