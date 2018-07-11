// @desc Define Variables
event_inherited();
hostile = true;
spd = 3;
combatSpd = 3;
combatSpdPix = combatSpd * CELL_SIZE;
moveRemaining = combatSpdPix;
maxActions = 3;
actions = maxActions;
attackRange = MELEE_RANGE
attackRangePix = attackRange * CELL_SIZE;
defaultAttackAbility = "Dagger";
defaultSupportAbility = "Lessor Heal";
hp = 12;
maxHp = hp;
aggroRange = 5;
aggroRangePix = aggroRange * CELL_SIZE;
packSize = 1;
packID = 0;
inCombat = false;
initiative = random(5) + spd;


historySize = 100;
xMoveHistory = array_create(historySize);
yMoveHistory = array_create(historySize);
