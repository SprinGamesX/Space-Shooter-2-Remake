#macro RARECHANCE 0.4
#macro EPICCHANCE 0.25
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
		if (_stat < 10){
			scale = 0.1;
			stat = CHIPSTAT.ATK;
		}
		else if (_stat < 20){
			scale = 0.13;
			stat = CHIPSTAT.HP;
		}
		else if (_stat < 25){
			scale = 0.05;
			stat = CHIPSTAT.HEALINGBONUS;
		}
		else if (_stat < 30){
			scale = 0.1;
			stat = CHIPSTAT.EFFECTCHANCE;
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
		else if (_stat < 62.5){
			scale = 0.05;
			stat = CHIPSTAT.ASPD;
		}
		else if (_stat < 65){
			scale = 0.03;
			stat = CHIPSTAT.ENERGYBOOST;
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
		case CHIPSTAT.ENERGYBOOST: return "ENERGY BOOST";
		case CHIPSTAT.HEALINGBONUS: return "HEALING BONUS";
		case CHIPSTAT.EFFECTCHANCE: return "EFFECT CHANCE";
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

function FindChip(_chip){
	for (var i = 0; i < ds_list_size(oInventoryManager.inventory) and instance_exists(_chip); i++){
		if (_chip.uuid == oInventoryManager.inventory[|i].uuid) return i;
	}
	return -1;
}
function FindChipByUUID(_uuid){
	for (var i = 0; i < ds_list_size(oInventoryManager.inventory); i++){
		if (_uuid == oInventoryManager.inventory[|i].uuid) return oInventoryManager.inventory[|i];
	}
	return noone;
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

function EquipChip(_chip){
	if (!instance_exists(_chip)) return false;
	var _chip2 = FindChipByUUID(global.chips[global.currentShip][global.currentShipSlot]);
	if (_chip2 != -1) UnequipChip(_chip2);
	
	
	global.chips[global.currentShip][global.currentShipSlot] = _chip.uuid;
	_chip.ownerId = global.currentShip;
	_chip.ownerSlot = global.currentShipSlot;
	return true;
}
function UnequipChip(_chip){
	if (!instance_exists(_chip)) return false;
	if (_chip.ownerId != -1){
		global.chips[_chip.ownerId][_chip.ownerSlot] = -1;
	}
	_chip.ownerId = -1;
	_chip.ownerSlot = -1;
	return true;
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

function GetStatFromChip(_type){
	switch(_type){
		case CHIPSTAT.ATK: return STAT.ATK;
		case CHIPSTAT.HP: return STAT.HP;
		case CHIPSTAT.ASPD: return STAT.ASPD;
		case CHIPSTAT.CRITRATE: return STAT.CRIT;
		case CHIPSTAT.CRITDMG: return STAT.CRITDMG;
		case CHIPSTAT.SPD: return STAT.SPD;
		case CHIPSTAT.RES: return STAT.RES;
		case CHIPSTAT.ICEDMG: return STAT.ICEDMG;
		case CHIPSTAT.FIREDMG: return STAT.FIREDMG;
		case CHIPSTAT.LIFEDMG: return STAT.LIFEDMG;
		case CHIPSTAT.VENOMDMG: return STAT.VENOMDMG;
		case CHIPSTAT.LIGHTNINGDMG: return STAT.LIGHTNINGDMG;
		case CHIPSTAT.STEELDMG: return STAT.STEELDMG;
		case CHIPSTAT.QUANTUMDMG: return STAT.QUANTUMDMG;
		case CHIPSTAT.ENERGYBOOST: return STAT.ENERGYBOOST;
		case CHIPSTAT.HEALINGBONUS: return STAT.HEALING_BONUS;
		case CHIPSTAT.EFFECTCHANCE: return STAT.EFFECT_CHANCE;
		
	}
	return -1;
}

function GetChipForElement(_element){
	switch(_element){
		case ELEMENT.ICE: return CHIPSTAT.ICEDMG;
		case ELEMENT.FIRE: return CHIPSTAT.FIREDMG;
		case ELEMENT.LIFE: return CHIPSTAT.LIFEDMG;
		case ELEMENT.VENOM: return CHIPSTAT.VENOMDMG;
		case ELEMENT.LIGHTNING: return CHIPSTAT.LIGHTNINGDMG;
		case ELEMENT.STEEL: return CHIPSTAT.STEELDMG;
		case ELEMENT.QUANTUM: return CHIPSTAT.QUANTUMDMG;
	}
}
