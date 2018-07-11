/// @description 

maxCharactersShowable = 0;
numCharacters = 0;
defaultWidth = 200;
defaultHeight = 100;
defaultSpacing = 10;
minBuffer = 100;

startPosX = global.ViewWidth - defaultSpacing - defaultWidth
startPosY = 0;

updateTrackerPos = true;
updateScreenPos = true;
	
if (ds_list_empty(global.InitiativeList)) show_message("No Combatants for Initiative")
else
{
	numCharacters = ds_list_size(global.InitiativeList);
}

