/// @description

var _m = map[global.domainIndex];

var spacex = 256;
var xx = room_width/2 - spacex;
draw_setup(font_fipps, make_color_rgb(217, 36, 47));

if !(global.endboss and global.domainIndex == array_length(map) - 1){
	for (var i = 0; i < 3; i++){
		if (selection == i){
			var _color = make_color_rgb(217, 36, 47);
			draw_line_width_color(xx - 128, 0, xx - 128, room_height, 15, _color, _color);
			draw_line_width_color(xx + 128, 0, xx + 128, room_height, 15, _color, _color);
			_color = make_color_rgb(96, 16, 21);
			draw_rectangle_color(xx - 128, 0, xx + 128, room_width, _color, _color, _color, _color, false);
		}
		draw_sprite_ext(sDomains, _m[i], xx, room_height/2 - 64, 2, 2, 0, c_white, 1);
		draw_text_scribble(xx, room_height/2, "[scale, 0.5]" + GetDomainTitle(_m[i]));
		xx += spacex;
	}
}
else {
	xx = room_width/2;
	var _color = make_color_rgb(217, 36, 47);
	draw_line_width_color(xx - 128, 0, xx - 128, room_height, 15, _color, _color);
	draw_line_width_color(xx + 128, 0, xx + 128, room_height, 15, _color, _color);
	_color = make_color_rgb(96, 16, 21);
	draw_rectangle_color(xx - 128, 0, xx + 128, room_width, _color, _color, _color, _color, false);
	
	draw_sprite_ext(sDomains, _m, xx, room_height/2 - 64, 2, 2, 0, c_white, 1);
	draw_text_scribble(xx, room_height/2, "[scale, 0.5]" + GetDomainTitle(_m));
}