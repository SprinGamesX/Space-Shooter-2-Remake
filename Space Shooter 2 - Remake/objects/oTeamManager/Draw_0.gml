/// @description

var _alpha = 1;
if (team[active_index].x < 100 and team[active_index].y >= room_height - padding - 100) _alpha = 0.3;
// Draw Main ship gui
var _s = team[active_index];
var _xx = padding;
var _yy = room_height - padding;
var _color = c_white;

draw_sprite_ext(sShipGui, 0, _xx, _yy, 1, 1, 0, _color, _alpha);

// Draw HP and CD Bars
var _hp = (_s.hp/_s.getMaxHp())*100;
var _shield = min((_s.shield/_s.getMaxHp())*100, 100);
var _skill_cd_progress = 100 - ((_s.skill_cd/_s.base_skill_cd) * 100)
var _ult_cd_progress = ((_s.energy/_s.max_energy) * 100)
draw_sprite_stretched_ext(sShipGuiBarHP, 0, _xx + 4, _yy - 24,(216 * _hp / 100), 20, _color, _alpha);
if (_s.shield > 0){
	draw_sprite_stretched_ext(sShipGuiBarHP, 1, _xx + 4, _yy - 24,(216 * _shield / 100), 20, _color, _alpha);
}
draw_sprite_stretched_ext(sShipGuiBarCDs, 1, _xx + 96, _yy - 42,(124 * _skill_cd_progress / 100), 14, _color, _alpha);
draw_sprite_stretched_ext(sShipGuiInactiveCD2, 0, _xx + 4 , _yy - 30 - (88 * _ult_cd_progress / 100), 88, (88 * _ult_cd_progress / 100), ColorForElement(_s.element), _ult_cd_progress == 100 ? _alpha - 0.1 : _alpha - 0.7);

// Draw Ammo
draw_setup(font_fipps, c_white, fa_left, fa_bottom);
var _text = "[scale, 0.5]Reloading.."
if (_s.ammo > 0) _text = "[scale, 0.5]AMMO: " + string(_s.ammo) + " / " + string(_s.max_ammo);
draw_text_scribble(_xx + 100, _yy - 36, _text);

// Draw ship icon
draw_sprite_ext(_s.sprite_index,_s.image_index , _xx + 48, _yy - 75, 1, 1, 0, _color, _alpha );

draw_sprite_ext(sShipGui, 1, _xx, _yy, 1, 1, 0, _color, _alpha);


// Draw team gui
var _team = getInactiveShips();
for (var i = 0; i < 2; i++){
	var _dead = false;
	_s = _team[i];
	if (_team[i].hp <= 0) {
		_color = c_dkgray
		_dead = true;
	}
	else _color = c_white;
	_xx = room_width - (128 + padding + (128* abs(1-i)));
	_yy = room_height - padding;
	draw_sprite_ext(sShipGuiInactive, 0, _xx, _yy, 1, 1, 0, _color, _alpha);

	// Draw HP and CD Bars
	_hp = (_s.hp/_s.getMaxHp())*100;
	_shield = min((_s.shield/_s.getMaxHp())*100, 100);
	_skill_cd_progress = 100 - ((_s.skill_cd/_s.base_skill_cd) * 100)
	_ult_cd_progress = ((_s.energy/_s.max_energy) * 100)
	draw_sprite_stretched_ext(sShipGuiBarHP, 0, _xx + 2, _yy - 24,(92 * _hp / 100), 20, _color, _alpha);
	if (_s.shield > 0){
		draw_sprite_stretched_ext(sShipGuiBarHP, 1, _xx + 2, _yy - 24,(92 * _shield / 100), 20, _color, _alpha);
	}
	draw_sprite_stretched_ext(sShipGuiInactiveCD, 0, _xx + 96 , _yy - 2 - (118 * _skill_cd_progress / 100), 14, (118 * _skill_cd_progress / 100), _color, _alpha);
	
	draw_sprite_stretched_ext(sShipGuiInactiveCD2, 0, _xx + 4 , _yy - 30 - (88 * _ult_cd_progress / 100), 88, (88 * _ult_cd_progress / 100), ColorForElement(_s.element), _ult_cd_progress == 100 ? _alpha - 0.1 : _alpha - 0.7);
	
	//Draw ship icon
	draw_sprite_ext(_s.sprite_index,_s.image_index , _xx + 48, _yy - 75, 1, 1, 0, _color, _alpha);
	
	draw_sprite_ext(sShipGuiInactive, 1, _xx, _yy, 1, 1, 0, _color, _alpha);
	
	if (_dead){
		draw_sprite_ext(sShipGuiDead, 1, _xx, _yy, 1, 1, 0, c_white, _alpha);
	}
}