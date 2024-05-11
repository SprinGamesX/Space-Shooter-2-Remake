/// @description
#macro XLIM room_width - 64


var _xx = 64;
var _yy = 64;
for (var i = 0; i < array_length(global.ships); i++){
	var _ship = global.ships[i];
	var _s = instance_create_depth(-100, -100, 999, _ship);
	var _alpha = 1;
	
	if (i == global.party[global.party_index-1]) _alpha = 0.2;
	
	draw_sprite_ext(sShipSelector, 0, _xx, _yy, 1, 1, 0, ColorForElement(_s.element), _alpha);
	if (i == selection) draw_sprite_ext(sShipSelector, 1, _xx, _yy, 1, 1, 0, c_white, 1);
	draw_sprite_ext(_s.sprite_index, 0, _xx, _yy, 1, 1, 0, c_white, _alpha);
	
	_xx += 128;
	if (_xx > XLIM) {
		_xx = 64;
		_yy += 128;
	}
	
	instance_destroy(_s);
}