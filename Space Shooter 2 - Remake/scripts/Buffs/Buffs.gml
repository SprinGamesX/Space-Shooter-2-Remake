// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CheckForExistingBuffs(_list, _name){
	var existing = -1;
	for (var i = 0; i < ds_list_size(_list); i++){
		if (_list[|i].name == _name) existing = i;
	}
	return existing;
}

function CountExistingBuffs(_list, _name){
	var existing = 0;
	for (var i = 0; i < ds_list_size(_list); i++){
		if (_list[|i].name == _name) existing++;
	}
	return existing;
}

function CreateBuffIndicator(_positive, _stat, _scale, _x = x, _y = y){
	var _text = "";
	
	if (_positive) _text += "+";
	else _text += "-";
	
	_text += string(_scale * 100) + "% ";
	
	_text += StatToString(_stat);
	
	with(instance_create_layer(_x, _y, "Misc", oDamage)){
		onCreate(_text, c_white, font_stat);
	}
		
}

function ApplyBuff(_list,_name ,_isInfinite, _isPositive, _stat, _scale, _duration, _stacking = 1, _stacks = 1, _owner = self, _show_indicator = false){
	var _inst = instance_create_depth(-100, -100, 999, cStatus)
	var _check = CheckForExistingBuffs(_list, _name);
	with (_inst){
		name = _name;
		infinite = _isInfinite;
		if (_isPositive) multiplier = 1;
		else multiplier = -1;
		duration = _duration;
		stat = _stat;
		scale = _scale;
		owner = _owner;
		max_stack = _stacking;
		stack = _stacks;
	}
	// if ship does not have the buff
	if (_check == -1){
		ds_list_add(_list, _inst);
		if (_show_indicator)
			CreateBuffIndicator(_isPositive, _stat, _scale);
	}
	
	// if buff exists
	else{
		// if buff does/doesn't stack
		if (_stacking == 1){
			ds_list_replace(_list,_check,_inst);
		}
		else {
			_inst = _list[| _check];
			_inst.addStack(_stacks, _duration);
			if (_show_indicator)
				CreateBuffIndicator(_isPositive, _stat, _scale);
		}
		
	}

	
	
	return _inst;
}

function ApplyDebuff(_enemy,_name ,_isInfinite, _isPositive, _stat, _scale, _duration, _stacking = 1, _stacks = 1, _owner = self, _show_indicator = false){
	var _list = _enemy.statuses;
	var _inst = instance_create_depth(-100, -100, 999, cStatus)
	var _check = CheckForExistingBuffs(_list, _name);
	with (_inst){
		name = _name;
		infinite = _isInfinite;
		if (_isPositive) multiplier = 1;
		else multiplier = -1;
		duration = _duration;
		stat = _stat;
		scale = _scale;
		owner = _owner;
		max_stack = _stacking;
		stack = _stacks;
	}
	// if ship does not have the buff
	if (_check == -1){
		ds_list_add(_list, _inst);
		if (_show_indicator)
			CreateBuffIndicator(_isPositive, _stat, _scale, _enemy.x, _enemy.y);
	}
	
	// if buff exists
	else{
		// if buff does/doesn't stack
		if (_stacking == 1){
			ds_list_replace(_list,_check,_inst);
		}
		else {
			_inst = _list[| _check];
			_inst.addStack(_stacks, _duration);
			if (_show_indicator)
				CreateBuffIndicator(_isPositive, _stat, _scale, _enemy.x, _enemy.y);
		}
		
	}

	
	return _inst;
}

function CleanBuffs(_list){
	var i = ds_list_size(_list) - 1;
	while(i >= 0 and !ds_list_empty(_list)){
		if (!instance_exists(_list[|i])){
			ds_list_delete(_list, i);
			i--;
		}
		else if (_list[|i].isOver()) {
			var _i = _list[|i];
			ds_list_delete(_list, i);
			instance_destroy(_i);
		}
		else i--;
	}
}

function GetChipType(_type){
	switch(_type){
		case STAT.ATK: return CHIPSTAT.ATK;
		case STAT.HP: return CHIPSTAT.HP;
		case STAT.ASPD: return CHIPSTAT.ASPD;
		case STAT.CRIT: return CHIPSTAT.CRITRATE;
		case STAT.CRITDMG: return CHIPSTAT.CRITDMG;
		case STAT.SPD: return CHIPSTAT.SPD;
		case STAT.RES: return CHIPSTAT.RES;
		case STAT.ICEDMG: return CHIPSTAT.ICEDMG;
		case STAT.FIREDMG: return CHIPSTAT.FIREDMG;
		case STAT.LIFEDMG: return CHIPSTAT.LIFEDMG;
		case STAT.VENOMDMG: return CHIPSTAT.VENOMDMG;
		case STAT.LIGHTNINGDMG: return CHIPSTAT.LIGHTNINGDMG;
		case STAT.STEELDMG: return CHIPSTAT.STEELDMG;
		case STAT.QUANTUMDMG: return CHIPSTAT.QUANTUMDMG;
		
	}
	return -1;
}

function GetBuffByType(_attacker, _type){
	var _buff = 0;
	var _isShip = false;
	var _list = _attacker.statuses;
	if (object_is_ancestor(_attacker.object_index, oParentShip)) _isShip = true;
	if (_isShip)
		var _chips = _attacker.chips;
		
	for (var i = 0; i < ds_list_size(_list); i++){
		if (_list[|i].stat == _type) _buff += _list[|i].get();
	}
	if (_isShip){
		var _chipstat = GetChipType(_type);
	
		for (var i = 0; _chipstat != -1 and i < array_length(_chips); i++){
			if (instance_exists(_chips[i])) and (_chips[i].stat == _chipstat) _buff += _chips[i].get();
		}}
	return _buff;
}

function GetElementalBuff(_attacker ,_element){
	 
	switch(_element){
		case ELEMENT.ICE: return GetBuffByType(_attacker, STAT.ICEDMG);
		case ELEMENT.FIRE: return GetBuffByType(_attacker, STAT.FIREDMG);
		case ELEMENT.LIGHTNING: return GetBuffByType(_attacker, STAT.LIGHTNINGDMG);
		case ELEMENT.LIFE: return GetBuffByType(_attacker, STAT.LIFEDMG);
		case ELEMENT.VENOM: return GetBuffByType(_attacker, STAT.VENOMDMG);
		case ELEMENT.STEEL: return GetBuffByType(_attacker, STAT.STEELDMG);
		case ELEMENT.QUANTUM: return GetBuffByType(_attacker, STAT.QUANTUMDMG);
	}
}
