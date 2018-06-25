// Define Variables
event_inherited();
hostile = true;
spd = 3;
combatSpd = 3;
combatSpdPix = combatSpd * CELL_SIZE;
moveRemaining = combatSpdPix;
maxActions = 1;
actions = maxActions;
attackRange = MELEE_RANGE
attackRangePix = attackRange * CELL_SIZE;

historySize = 100;
xMoveHistory = array_create(historySize);
yMoveHistory = array_create(historySize);
