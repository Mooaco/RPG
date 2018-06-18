/// @desc Debug Draw

draw_self()

if (global.States == States.InCombat)
{
	var MarginFromTop = y + 40
	var HorizontalCentre = x-100

	draw_set_colour(c_white);
	draw_text(HorizontalCentre, MarginFromTop, "Actions remaining " + string(maxActions-actions) )
}

//draw_text(HorizontalCentre, MarginFromTop + 80, "M_X: " + string(mouse_x) + " | Y: " + string(mouse_y))
