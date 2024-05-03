/// @description Insert description here
// You can write your code in this editor

var barWidth = 94 * 2;
var _color = ColorForElement(element);

draw_sprite_ext(sEnemyHpBar, 1, room_width/2, 32, 2, 2, 0, _color, 1)

draw_sprite_ext(sEnemyHpCover, 0, room_width/2 + barWidth, 32,2*(1 - hp/base_hp), 2,0 ,_color, 1)

draw_sprite_ext(sEnemyHpBar, 0, room_width/2, 32, 2, 2, 0, _color, 1);



