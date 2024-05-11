/// @description

draw_setup(font_fipps);
draw_text_scribble(room_width/2, 128, "[scale,2][rainbow]P A R T Y");



var xx = room_width / 2;
var yy = room_height / 2;

draw_setup(font_UI);
for (var i = -1; i < 2; i++){
	var _ship = global.ships[global.party[i+1]];
	var _s = instance_create_depth(-100, -100, 999, _ship);
	
	draw_sprite_ext(sShipSelector, 0, xx + 96 * i, yy, 1, 1, 0, ColorForElement(_s.element), 1);
	draw_text_scribble(xx + 96 * i, yy - 64, string(i + 2));
	if (i + 2 == global.party_index){
		draw_sprite_ext(sShipSelector, 1, xx + 96 * i, yy, 1, 1, 0, c_white, 1);
	}
	draw_sprite_ext(_s.sprite_index, 0, xx + 96 * i, yy, 1, 1, 0, c_white, 1);

	instance_destroy(_s);
}