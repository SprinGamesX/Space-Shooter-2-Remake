// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_setup(_font = font_fipps, _color = c_white, _halign = fa_center, _valign = fa_middle){
	draw_set_font(_font);
	draw_set_color(_color);
	draw_set_halign(_halign);
	draw_set_valign(_valign);
}

function CreateDmgIndicator(_text, _x, _y, _element = ELEMENT.NONE){
	with(instance_create_layer(_x, _y, "Misc", oDamage)){
		onCreate(_text, ColorForElement(_element));
	}
}

function ColorForElement(_element){
	switch(_element){
		case ELEMENT.ICE: return c_aqua;
		case ELEMENT.FIRE: return c_orange;
		case ELEMENT.LIFE: return c_lime;
		case ELEMENT.LIGHTNING: return c_yellow;
		case ELEMENT.STEEL: return c_gray;
		case ELEMENT.QUANTUM: return c_blue;
		case ELEMENT.VENOM: return c_purple;
		case ELEMENT.NONE: return c_white;
	}
}