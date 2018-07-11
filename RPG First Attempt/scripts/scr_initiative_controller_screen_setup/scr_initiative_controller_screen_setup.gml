/// scr_initiative_controller_screen_setup(Initiative_Controller)
/// @param Initiative_Controller

var initCon = argument0;

var i = initCon.minBuffer + 1;
while (i > initCon.minBuffer)
{
	initCon.startPosY = i;
	initCon.maxCharactersShowable++;
	i = (initCon.maxCharactersShowable * initCon.defaultHeight) + (initCon.maxCharactersShowable - 1 * initCon.defaultSpacing) - global.ViewHeight;
}