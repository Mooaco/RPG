///@desc Fade out text

alpha -= 0.01;
ypos += 1;

draw_text_color(x, y - ypos, text, c_white, c_white, c_white ,c_white , alpha);

if (alpha <= 0) instance_destroy();