// Game States
enum States
{
	OutOfCombat = 0,
	InCombat = 1
}

enum Turn
{
	PlayerTurn,
	EnemyTurn
}

enum Camera_Zoom
{
	VeryClose = 0.2,
	Close = 0.5,
	Standard = 1,
	Far = 2,
	VeryFar = 4,
	ZoomIn = -1,
	ZoomOut = -2
}