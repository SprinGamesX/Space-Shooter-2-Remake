/// @description

var xx = (room_width div 5) * 4;
var yy = room_height - 128;
var _space = 96;
var _spacey = 144;

var _arr = GetShipTree(global.currentShip);
var _asc = 0;

var _ship = global.ships[global.currentShip];
var _s = instance_create_layer(-100, -100, "Instances", _ship);
var _color = ColorForElement(_s.element);

draw_setup(font_menu_details, c_white, fa_left);
draw_text_scribble(16, room_height-32, "[scale, 0.5]Go Back - S   MOVE LEFT - A   MOVE RIGHT - D")

// Draw abilites n stuff
var _xx = 64;
var _yy = 64;
var _area_width = 512;
var _area_height = room_height - _yy;

draw_sprite_stretched_ext(sUIBox, 0, 16, 16, _area_width, _area_height, ColorForElement(_s.element), 1);
draw_sprite_ext(_s.sprite_index, 0, _xx, _yy, 2, 2, 0, c_white, 1);
draw_sprite_ext(sElementalIcons, _ship.element, _xx + 64, _yy + 16, 2, 2, 0, c_white, 1);
draw_setup(font_UI, _color, fa_left);
draw_text_scribble(_xx + 96, _yy + 16, "[scale,0.6]LV: " + string(global.shipLv[global.currentShip]));


_yy += 128;
for (var i = 0; i < 5; i++){
	if (i == selector) draw_sprite_ext(sAbiltySelect, 0, _xx + 96*i, _yy, 1, 1, 0, _color, 1);
	draw_sprite_ext(sAbilityButtons, i, _xx + 96*i, _yy, 1, 1, 0, _color, 1);
}
_yy += 64;
var _title = "Basic Attack";
switch(selector){
	case 1:
		_title = "Skill"
	break;
	case 2:
		_title = "Ultimate"
	break;
	case 3:
		_title = "Passive"
	break;
	case 4:
		_title = "Skill Tree"
	break;
}

draw_setup(font_UI, _color, fa_left);
draw_text_scribble(_xx-32, _yy, "[scale, 1]" + _title);


// Draw Tree
// Floor 1
#macro TILE 80
#macro STARTX 688
#macro STARTY 120

var skill_tree = GetTreeForElement(_s.element);

draw_sprite_ext(sElementsST, _s.element, 464*2, room_height/2, 1, 1, 0, c_white, 0.2);
draw_setup(font_chips)

for (yy = 0; yy < 7; yy++){
	for (xx = 0; xx < 7; xx++){
		var _index = skill_tree[yy][xx];
		if (_index > 1){
			var _d = FindDependency(_s.element,_index);
			var _d1 = FindXYInST(skill_tree, _d);
			var _x1 = STARTX + xx*TILE;
			var _y1 = STARTY + yy*TILE;
			var _x2 = STARTX + _d1[0]*TILE;
			var _y2 = STARTY + _d1[1]*TILE;
			draw_line_width_color(_x1-1, _y1-1, _x2-1, _y2-1, 4, _color, _color);
		}
	}
}



for (yy = 0; yy < 7; yy++){
	for (xx = 0; xx < 7; xx++){
		//draw_text_scribble(STARTX + xx * TILE, STARTY + yy * TILE, "[scale,0.5](x: " + string(xx) + ",y:" + string(yy) + ")" )
		var _index = skill_tree[yy][xx];
		if (_index != 0){
			if (_index == 1 or _index == 4 or _index == 9){
				draw_sprite_ext(sTreeNodeBug, 0, STARTX + xx*TILE, STARTY + yy*TILE, 1,1, 0, _color, 1);
				draw_sprite_ext(sPassiveSymb, 0, STARTX + xx*TILE, STARTY + yy*TILE, 1.2,1.2, 0, _color, 1);
			}
			
			else {
				if (_index > 9) _index -= 4;
				else if (_index > 4) _index -= 3;
				else if (_index > 1) _index -= 2;
				
				draw_sprite_ext(sTreeNode, 0, STARTX + xx*TILE, STARTY + yy*TILE, 1,1, 0, _color, 1);
				draw_sprite_ext(sChipSymb, _arr[_index][0], STARTX + xx*TILE, STARTY + yy*TILE, 1,1, 0, _color, 1);
			}
		}
	}
}

instance_destroy(_s);