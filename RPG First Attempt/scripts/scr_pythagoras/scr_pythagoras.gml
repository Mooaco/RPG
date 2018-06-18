///scr_pythagoras(x1,y1,x2,y2) zz

var x1 = argument0
var y1 = argument1
var x2 = argument2
var y2 = argument3

var xx = sqr(x1 - x2);
var yy = sqr(y1 - y2);
			
// If variable is a negative number, make it positive
if (xx < 0) xx = xx * -1;
if (yy < 0) yy = yy * -1;
			
// Find the distance between them diagonally
var zz = sqrt(xx + yy);
return zz