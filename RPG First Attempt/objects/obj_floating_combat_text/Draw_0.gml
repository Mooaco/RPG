/// Fade out text

//alpha += 0.01;
ypos += 1;

draw_text_color(x, y - ypos, text, 0, 0, 0 ,0 , 1 - alpha);

if (ypos >= 100) instance_destroy();