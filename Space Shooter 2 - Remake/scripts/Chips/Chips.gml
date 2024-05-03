#macro RARECHANCE 0.25
#macro EPICCHANCE 0.2
#macro PERFECTCHANCE 0.05


function GenerateChipStat(){
	// get last uuid
	ini_open("data.ini");
	var _uuid = ini_read_real("UUID", "last", -1);
	ini_close();
	
	var _inst = instance_create_depth(-100, -100, 999, cChip);
	randomize();
	with(_inst){
		var _stat = random(100);
		uuid = _uuid+1;
		if (_stat < 15){
			scale = 0.1;
			stat = CHIPSTAT.ATK;
		}
		else if (_stat < 30){
			scale = 0.13;
			stat = CHIPSTAT.HP;
		}
		else if (_stat < 35){
			scale = 0.08;
			stat = CHIPSTAT.CRITRATE;
		}
		else if (_stat < 40){
			scale = 0.16;
			stat = CHIPSTAT.CRITDMG;
		}
		else if (_stat < 50){
			scale = 0.025;
			stat = CHIPSTAT.SPD;
		}
		else if (_stat < 60){
			scale = 0.025;
			stat = CHIPSTAT.RES;
		}
		else if (_stat < 65){
			scale = 0.05;
			stat = CHIPSTAT.ASPD;
		}
		else if (_stat < 70){
			scale = 0.05;
			stat = CHIPSTAT.ICEDMG;
		}
		else if (_stat < 75){
			scale = 0.05;
			stat = CHIPSTAT.FIREDMG;
		}
		else if (_stat < 80){
			scale = 0.05;
			stat = CHIPSTAT.LIFEDMG;
		}
		else if (_stat < 85){
			scale = 0.05;
			stat = CHIPSTAT.VENOMDMG;
		}
		else if (_stat < 90){
			scale = 0.05;
			stat = CHIPSTAT.LIGHTNINGDMG;
		}
		else if (_stat < 95){
			scale = 0.05;
			stat = CHIPSTAT.STEELDMG;
		}
		else if (_stat <= 100){
			scale = 0.05;
			stat = CHIPSTAT.QUANTUMDMG;
		}
		
	}
	ini_open("data.ini");
	ini_write_real("UUID", "last", _uuid+1);
	ini_close();
	return _inst;
}

function GenerateRandomChip(){
	var _chip = GenerateChipStat();
	var _multiplier = 0;
	var _rarity = RARITY.COMMON;
	randomize();
	if (RollChance(RARECHANCE)){
		_multiplier ++;
		_rarity = RARITY.RARE;
		if (RollChance(EPICCHANCE)){
			_multiplier++;
			_rarity = RARITY.EPIC;
			if (RollChance(PERFECTCHANCE)){
				_multiplier++;
				_rarity = RARITY.PERFECT;
			}
		}
	}
	with(_chip){
		scale = scale * (_multiplier + random_range(0.01, 1));
		rarity = _rarity;
	}
	show_debug_message(_chip);
	return _chip;
	
}

function ColorForChipRarity(_chip){
	switch(_chip.rarity){
		case RARITY.COMMON: return c_white;
		case RARITY.RARE: return make_color_rgb(39, 175, 244);
		case RARITY.EPIC: return make_color_rgb(185, 88, 196);
		case RARITY.PERFECT: return make_color_rgb(49, 255, 155);
	}
}

function GetRarityString(_rarity){
	switch(_rarity){
		case RARITY.COMMON: return "Common";
		case RARITY.RARE: return "Rare";
		case RARITY.EPIC: return "Epic";
		case RARITY.PERFECT: return "Perfect";
	}
}
function GetChipStatString(_stat){
	switch(_stat){
		case CHIPSTAT.ATK: return "ATK";
		case CHIPSTAT.ASPD: return "ASPD";
		case CHIPSTAT.CRITDMG: return "CRIT DMG";
		case CHIPSTAT.CRITRATE: return "CRIT RATE";
		case CHIPSTAT.HP: return "HP";
		case CHIPSTAT.RES: return "RES";
		case CHIPSTAT.SPD: return "SPEED";
		case CHIPSTAT.FIREDMG: return "FIRE DMG";
		case CHIPSTAT.ICEDMG: return "ICE DMG";
		case CHIPSTAT.LIFEDMG: return "LIFE DMG";
		case CHIPSTAT.LIGHTNINGDMG: return "LIGHTNING DMG";
		case CHIPSTAT.QUANTUMDMG: return "QUANTUM DMG";
		case CHIPSTAT.STEELDMG: return "STEEL DMG";
		case CHIPSTAT.VENOMDMG: return "VENOM DMG";
	}
}

function DecompressChip(_array){
	var _inst = instance_create_depth(-100, -100, 999, cChip);
	with(_inst){
		uuid = _array[0];
		rarity = _array[1];
		scale = _array[2];
		stat = _array[3];
		ownerId = _array[4];
		ownerSlot = _array[5];
	}
	show_debug_message("Chip Decompressed")
	return _inst;
}

function SaveChip(_uuid){
	global.chips[global.currentShip][global.currentShipSlot] = _uuid;
}

function UnequipCurrentChip(_uuid){
	for (var i = 0; i < ds_list_size(oInventoryManager.inventory); i++){
		if (oInventoryManager.inventory[|i].uuid == _uuid){
			with (oInventoryManager.inventory[|i]){
				ownerId = -1;
				ownerSlot = -1;
			}
		}
	}
	return false;
}

function GetChipStat(_array, _stat){
	var _sum = 0;
	for (var i = 0; i < array_length(_array); i++){
		if (_array[i] != -1){
			var _chip = oInventoryManager.getChip(_array[i]);
			if (_chip.stat == _stat) _sum += _chip.get();
		}
	}
	return _sum;
}