/// @description Insert description here
// You can write your code in this editor


// Draw Main ship gui
var _s = team[active_index];
draw_sprite(sShipGui, 0, padding, room_height - padding);

// Draw ship icon
draw_sprite(team[active_index].sprite_index,team[active_index].image_index , padding + 48, room_height - padding - 48);
// Draw HP and CD Bars
var _hp = (_s.hp/_s.base_hp)*100;
var _skill_cd_progress = 100 - ((_s.skill_cd/_s.base_skill_cd) * 100)
var _ult_cd_progress = ((_s.energy/_s.max_energy) * 100)
draw_sprite_stretched_ext(sShipGuiBarHP, 0, 96 + padding, room_height - padding - 24,(190 * _hp / 100), 20, c_white, 1);
draw_sprite_stretched_ext(sShipGuiBarCDs, 0, 96 + padding, room_height - padding - 60,(190 * _skill_cd_progress / 100), 14, c_white, 1);
draw_sprite_stretched_ext(sShipGuiBarCDs, 1, 96 + padding, room_height - padding - 42,(190 * _ult_cd_progress / 100), 14, c_white, 1);

// Draw Ammo
draw_setup(font_fipps, c_white, fa_left, fa_bottom);
var _text = "[scale, 0.5]Reloading.."
if (_s.ammo > 0) _text = "[scale, 0.5]AMMO: " + string(_s.ammo) + " / " + string(_s.base_ammo);
draw_text_scribble(padding + 100, room_height - padding - 54, _text);

draw_sprite(sShipGui, 1, padding, room_height - padding);


// Draw team gui