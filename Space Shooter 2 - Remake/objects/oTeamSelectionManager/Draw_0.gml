/// @description
#macro CENTERX 640
#macro CENTERY 360


draw_setup(font_menu_details, c_red);
var _string =  "LEVEL - " + levellist[levelIndex];
draw_text_scribble(CENTERX, 50, _string);
if (editor == EDITLEVEL){
	draw_sprite_ext(sGUIArrow, 0, CENTERX - (string_width(_string)/2 + 40 + movement), 50, 1, 1, 180, c_red, 1);
	draw_sprite_ext(sGUIArrow, 0, CENTERX + (string_width(_string)/2 + 40 + movement), 50, 1, 1, 0, c_red, 1);
}

var _string2 =  "DIFFICULTY - " + string(diff);
draw_text_scribble(CENTERX, 120, _string2);
if (editor == EDITDIFF){
	draw_sprite_ext(sGUIArrow, 0, CENTERX - (string_width(_string2)/2 + 40 + movement), 120, 1, 1, 180, c_red, 1);
	draw_sprite_ext(sGUIArrow, 0, CENTERX + (string_width(_string2)/2 + 40 + movement), 120, 1, 1, 0, c_red, 1);
}

var _string3 = "PRESS (SPACE) TO BEGIN";
draw_text_scribble(CENTERX, room_height - 50, + _string3);
if (editor == STARTCHALLANGE){
	draw_sprite_ext(sGUIArrow, 0, CENTERX - (string_width(_string3)/2 + 40 + movement), room_height - 50, 1, 1, 180, c_red, 1);
	draw_sprite_ext(sGUIArrow, 0, CENTERX + (string_width(_string3)/2 + 40 + movement), room_height - 50, 1, 1, 0, c_red, 1);
}



// Party
var xx = room_width / 4;
var yy = room_height / 2;
draw_setup(font_stat)
draw_sprite_stretched_ext(sUIBox, 0, xx - 100, yy - 50, 200, 100, c_lime, 1);
draw_text_scribble(xx, yy + 80, "PRESS (P) to adjust party");
for (var i = 0; i < 3; i++){
	draw_sprite(object_get_sprite(global.ships[global.party[i]]), 0, xx + (64*(i-1)), yy);
}
xx += 100;
for (var i = 0; i < 10; i++){
	xx += 32;
	draw_sprite_ext(sGUIArrow, 0, xx, yy,0.5,0.5,0,c_white, 1);
}


// Boss
xx = room_width / 4 * 3;
yy = room_height / 2;
draw_sprite_stretched_ext(sUIBox, 0, xx - 200, yy - 125, 400, 250, c_red, 1);
draw_setup(font_UI)
draw_text_scribble(xx, yy, "PH : BOSS")