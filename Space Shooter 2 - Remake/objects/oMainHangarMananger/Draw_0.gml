/// @description Insert description here
// You can write your code in this editor

var _ship = shiplist[ship_index];
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
if (global.shipLv[shipIndexs[ship_index]] < 100)
	draw_text_scribble(room_width/2, room_height - 90, (cost > global.drives ? "[c_maroon]" : "") + "Upgrade Ship\nCost: " + string(cost) + " [sDrive]");
else draw_text_scribble(room_width/2, room_height - 90, "MAXED");


// Stats
draw_setup(font_menu_details, ColorForElement(_s.element), fa_left);
var _xx = 32;
var _yy = 64;
var _arr = global.chips[ship_index];
draw_text_scribble(_xx, _yy, "Stats: ");
draw_setup(font_chips, ColorForElement(_s.element), fa_left);
draw_text_scribble(_xx, _yy + 32,   "[scale, 0.6]LV: " + string(global.shipLv[shipIndexs[ship_index]]));
_arr = [CHIPSTAT.ATK, CHIPSTAT.HP, CHIPSTAT.SPD, CHIPSTAT.CRITRATE, CHIPSTAT.CRITDMG, CHIPSTAT.RES, CHIPSTAT.ASPD, CHIPSTAT.ENERGYBOOST, CHIPSTAT.EFFECTCHANCE, CHIPSTAT.HEALINGBONUS, GetChipForElement(_s.element)];
for (var i = 0; i < array_length(_arr); i++){

	draw_text_scribble(_xx, _yy + 32*(2+i),"[scale, 0.75]" + GetChipStatString(_arr[i]) + ": " + string_format(GetShipStat(_s, GetStatFromChip(_arr[i])), 1, 1));

}

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