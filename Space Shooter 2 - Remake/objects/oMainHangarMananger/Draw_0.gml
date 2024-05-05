/// @description Insert description here
// You can write your code in this editor

var _ship = global.ships[ship_index];
var _s = instance_create_layer(-100, -100, "Instances", _ship);
draw_sprite_ext(object_get_sprite(_ship), 0, room_width/2, room_height/2, 2, 2, 90, c_white, 1);

// Arrows
draw_setup(font_menu_details, c_white);
draw_sprite(sArrow, 0, room_width/4 * 3, room_height - 90);
draw_sprite_ext(sArrow, 0, room_width/4, room_height - 90, 1, 1, 180, c_white, 1);
draw_sprite_ext(sArrow, 0, room_width/2, 45, 1, 1, 90, c_white, 1);
draw_text_scribble(room_width/4 * 3, room_height - 110, "D");
draw_text_scribble(room_width/4, room_height - 110, "A");
draw_text_scribble(room_width/2, 90, "SKILLS(W)");


// Stats
draw_setup(font_menu_details, ColorForElement(_s.element), fa_left);
var _xx = 32;
var _yy = 64;
var _arr = global.chips[ship_index];
draw_text_scribble(_xx, _yy, "Stats: ");
draw_setup(font_chips, ColorForElement(_s.element), fa_left);
draw_text_scribble(_xx, _yy + 32,   "[scale, 0.6]LV: " + string(global.shipLv[ship_index]));
draw_text_scribble(_xx, _yy + 32*2,   "[scale, 0.75]ATK: " + string(_s.base_atk + (_s.base_atk * GetChipStat(_arr, CHIPSTAT.ATK))));
draw_text_scribble(_xx, _yy + 32*3, "[scale, 0.75]HP: " + string(_s.base_hp + (_s.base_hp * GetChipStat(_arr, CHIPSTAT.HP))));
draw_text_scribble(_xx, _yy + 32*4, "[scale, 0.75]SPD: " + string(_s.base_spd + (_s.base_spd * GetChipStat(_arr, CHIPSTAT.SPD))));
draw_text_scribble(_xx, _yy + 32*5, "[scale, 0.75]RES: " + string(GetChipStat(_arr, CHIPSTAT.RES) * 100 )+ "%");
draw_text_scribble(_xx, _yy + 32*6, "[scale, 0.75]ASPD: " + string((_s.base_aspd + (_s.base_aspd * GetChipStat(_arr, CHIPSTAT.ASPD)))*100) + "%");
draw_text_scribble(_xx, _yy + 32*7, "[scale, 0.75]CRIT RATE: " + string((_s.base_crit + (GetChipStat(_arr, CHIPSTAT.CRITRATE))) *100)+ "%");
draw_text_scribble(_xx, _yy + 32*8, "[scale, 0.75]CRIT DMG: " + string((_s.base_critdmg + (GetChipStat(_arr, CHIPSTAT.CRITDMG))) * 100)+ "%");
draw_text_scribble(_xx, _yy + 32*9, "[scale, 0.75]EB: " + string((_s.base_energy_regen + (_s.base_energy_regen * GetChipStat(_arr, CHIPSTAT.ENERGYBOOST)))*100) +"%");
draw_text_scribble(_xx, _yy + 32*10, "[scale, 0.5]ICE DMG: " + string(GetChipStat(_arr, CHIPSTAT.ICEDMG)* 100 )+ "%");
draw_text_scribble(_xx, _yy + 32*11, "[scale, 0.5]FIRE DMG: " + string(GetChipStat(_arr, CHIPSTAT.FIREDMG)* 100 )+ "%");
draw_text_scribble(_xx, _yy + 32*12, "[scale, 0.5]LIFE DMG: " + string(GetChipStat(_arr, CHIPSTAT.LIFEDMG)* 100 )+ "%");
draw_text_scribble(_xx, _yy + 32*13, "[scale, 0.5]VENOM DMG: " + string(GetChipStat(_arr, CHIPSTAT.VENOMDMG)* 100 ) + "%");
draw_text_scribble(_xx, _yy + 32*14, "[scale, 0.5]LIGHTNING DMG: " + string(GetChipStat(_arr, CHIPSTAT.LIGHTNINGDMG)* 100 )+ "%");
draw_text_scribble(_xx, _yy + 32*15, "[scale, 0.5]STEEL DMG: " + string(GetChipStat(_arr, CHIPSTAT.STEELDMG)* 100 )+ "%");
draw_text_scribble(_xx, _yy + 32*16, "[scale, 0.5]QUANTUM DMG: " + string(GetChipStat(_arr, CHIPSTAT.QUANTUMDMG)* 100 )+ "%");




// Chips
draw_setup(font_menu_details, ColorForElement(_s.element), fa_center);
draw_text_scribble(room_width - 144, 64, "Chips");
var _c = 0;
for (var i = 1; i <= 2; i++){
	for (var j = 1; j <= 5; j++){
		var _x = room_width - (i * 96);
		var _y = 64 + (j * 96);
		draw_sprite_ext(sChipSlot, 0, _x, _y, 1, 1, 0, ColorForElement(_s.element), 1);
		var _id = global.chips[ship_index][_c];
		if (_id != -1){
			var _chip = oInventoryManager.getChip(_id);
			draw_sprite_ext(sChip, _chip.stat, _x, _y, 1, 1, 0, ColorForChipRarity(_chip), 1);
		}
		draw_setup(font_chips, ColorForElement(_s.element), fa_center);
		if (i == 1) {
			draw_text_scribble(_x, _y + 45, "[scale, 0.5]C-"+ string(j-1));
		}
		else {
			draw_text_scribble(_x, _y + 45,"[scale, 0.5]C-"+ string(j + 4));
		}
		_c++;
	}
}

instance_destroy(_s);