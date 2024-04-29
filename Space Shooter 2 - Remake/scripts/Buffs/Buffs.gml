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

function ApplyBuff(_list,_name ,_isInfinite, _isPositive, _stat, _scale, _duration, _stacking = 1, _stacks = 1, _owner = self){
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
			CreateBuffIndicator(_isPositive, _stat, _scale);
		}
		
	}

	
	
	return _inst;
}

function ApplyDebuff(_enemy,_name ,_isInfinite, _isPositive, _stat, _scale, _duration, _stacking = 1, _stacks = 1, _owner = self){
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

function GetBuffByType(_list, _type){
	var _buff = 0;
	for (var i = 0; i < ds_list_size(_list); i++){
		if (_list[|i].stat == _type) _buff += _list[|i].get();
	}
	return _buff;
}

function GetElementalBuff(_list ,_element){
	switch(_element){
		case ELEMENT.ICE: return GetBuffByType(_list, STAT.ICEDMG);
		case ELEMENT.FIRE: return GetBuffByType(_list, STAT.FIREDMG);
		case ELEMENT.LIGHTNING: return GetBuffByType(_list, STAT.LIGHTNINGDMG);
		case ELEMENT.LIFE: return GetBuffByType(_list, STAT.LIFEDMG);
		case ELEMENT.VENOM: return GetBuffByType(_list, STAT.VENOMDMG);
		case ELEMENT.STEEL: return GetBuffByType(_list, STAT.STEELDMG);
		case ELEMENT.QUANTUM: return GetBuffByType(_list, STAT.QUANTUMDMG);
	}
}
