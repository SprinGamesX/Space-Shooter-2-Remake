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
		onCreate(_text, ColorForElement(_element),Color2ForElement(_element));
	}
}
function CreateIndicator(_text, _x, _y, _element = ELEMENT.NONE, _font = font_stat){
	with(instance_create_layer(_x, _y, "Misc", oDamage)){
		onCreate(_text, ColorForElement(_element),Color2ForElement(_element));
		font = _font;
	}
}

function ColorForElement(_element){
	switch(_element){
		case ELEMENT.ICE: return make_color_rgb(121, 236, 238);
		case ELEMENT.FIRE: return make_color_rgb(238, 137, 64);
		case ELEMENT.LIFE: return make_color_rgb(75, 221, 80);
		case ELEMENT.LIGHTNING: return make_color_rgb(238, 235, 48);
		case ELEMENT.STEEL: return make_color_rgb(176, 172, 158);
		case ELEMENT.QUANTUM: return make_color_rgb(79,53,165);
		case ELEMENT.VENOM: return make_color_rgb(190, 83, 190);
		case ELEMENT.NONE: return make_color_rgb(192, 32, 43);
	}
}

function Color2ForElement(_element){
	switch(_element){
		case ELEMENT.ICE: return make_color_rgb(67, 130, 131);
		case ELEMENT.FIRE: return make_color_rgb(159, 92, 43);
		case ELEMENT.LIFE: return make_color_rgb(50, 148, 54);
		case ELEMENT.LIGHTNING: return make_color_rgb(162, 160, 33);
		case ELEMENT.STEEL: return make_color_rgb(114, 111, 102);
		case ELEMENT.QUANTUM: return make_color_rgb(49,33,103);
		case ELEMENT.VENOM: return make_color_rgb(124, 54, 124);
		case ELEMENT.NONE: return make_color_rgb(192, 32, 43);
	}
}

function StatToString(_stat){
	switch(_stat){
		case STAT.ATK: return "ATK";
		case STAT.ASPD: return "ASPD";
		case STAT.BA_BONUS: return "BASIC-ATTACK BONUS";
		case STAT.CRIT: return "CRIT";
		case STAT.CRITDMG: return "CRIT DMG";
		case STAT.DEF_PEN: return "DEF PEN";
		case STAT.DMG: return "DMG";
		case STAT.HP: return "MAX HP";
		case STAT.RES: return "RES";
		case STAT.RES_PEN: return "RES PEN";
		case STAT.SK_BONUS: return "SKILL BONUS";
		case STAT.SPD: return "SPD";
		case STAT.UT_BONUS: return "ULTIMATE BONUS";
		case STAT.ICEDMG: return "ICE DMG";
		case STAT.FIREDMG: return "FIRE DMG";
		case STAT.LIFEDMG: return "LIFE DMG";
		case STAT.VENOMDMG: return "VENOM DMG";
		case STAT.LIGHTNINGDMG: return "LIGHTNING DMG";
		case STAT.STEELDMG: return "STEEL DMG";
		case STAT.QUANTUMDMG: return "QUANTUM DMG";
		case STAT.DEF: return "DEF";
		case STAT.ENERGYBOOST: return "ENERGY BOOST";
		case STAT.DMG_RECIVED: return "DMG RECEIVED";
		case STAT.DOT_BONUS: return "DOT BONUS";
		case STAT.MAX_AMMO: return "MAX AMMO";
		case STAT.HEALING_BONUS: return "HEALING BONUS";
		case STAT.EFFECT_CHANCE: return "EFFECT CHANCE";
		case STAT.COOLDOWN: return "COOLDOWN";
		case STAT.FUA_BONUS: return "FOLLOW-UP BONUS";
		
		case STAT.ICERES: return "ICE RES";
		case STAT.FIRERES: return "FIRE RES";
		case STAT.LIFERES: return "LIFE RES";
		case STAT.LIGHTNINGRES: return "LIGHTNING RES";
		case STAT.VENOMRES: return "VENOM RES";
		case STAT.STEELRES: return "STEEL RES";
		case STAT.QUANTUMRES: return "QUANTUM RES";
	}
}