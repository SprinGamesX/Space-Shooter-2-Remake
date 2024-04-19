draw_setup();

draw_text_scribble(x_pos, 100, "[scale, 2][rainbow]Space Shooter 2")

var m1 = menu_index - 2;
var m2 = menu_index - 1;
var m3 = menu_index + 1;
var m4 = menu_index + 2;

if (m1 < 0) m1 += array_length(options);
if (m2 < 0) m2 += array_length(options);
if (m3 > menu_index_max) m3 -= array_length(options);
if (m4 > menu_index_max) m4 -= array_length(options);

draw_text_scribble(x_pos, y_pos - menu_space*1.75, "[alpha, 0.2][scale, 0.6]" + options[m1])
draw_text_scribble(x_pos, y_pos + menu_space*1.75, "[alpha, 0.2][scale, 0.6]" + options[m4])
draw_text_scribble(x_pos, y_pos - menu_space, "[alpha, 0.5][scale, 1]" + options[m2])
draw_text_scribble(x_pos, y_pos + menu_space, "[alpha, 0.5][scale, 1]" + options[m3])
draw_text_scribble(x_pos, y_pos, "[scale, 1.5][wave][rainbow]" + options[menu_index])


/*
if (menu_index >= 1){
	draw_text_scribble(x_pos, y_pos - menu_space, "[scale, 0.75][alpha,0.5]" + options[menu_index-1])
}

draw_text_scribble(x_pos, y_pos, options[menu_index])

if (menu_index <= menu_index_max-1){
	draw_text_scribble(x_pos, y_pos + menu_space, "[scale, 0.75][alpha,0.5]" + options[menu_index+1])
}
*/