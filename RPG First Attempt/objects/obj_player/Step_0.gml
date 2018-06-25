// End turn 

if (moveRemaining < (OFFSET * 1.5) && actions > 0)
{
	moveRemaining = combatSpdPix;
}

//// Move all variables down the array by 1
//for (var i = histroySize; i > 0; i -= 1)
//{
//	xMoveHistory[i] = xMoveHistory[i-1]
//	yMoveHistory[i] = yMoveHistory[i-1]
//}
	
//xMoveHistory[0] = x
//yMoveHistory[0] = y

	
ds_list_insert(xMoveHistory, 0, x)
if (ds_list_size(xMoveHistory) > historySize) ds_list_delete(xMoveHistory, historySize)

ds_list_insert(yMoveHistory, 0, y)
if (ds_list_size(yMoveHistory) > historySize) ds_list_delete(yMoveHistory, historySize)






