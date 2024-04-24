// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CheckForExistingBuffs(_list, _name){
	var existing = -1;
	for (var i = 0; i < ds_list_size(_list); i++){
		if (_list[|i].name == _name) existing = i;
	}
	return existing;
}

function ApplyBuff(_list,_name ,_isInfinite, _isPositive, _stat, _scale, _duration, _stackable = false){
	var _inst = instance_create_depth(-100, -100, 999, cStatus)
	with (_inst){
		name = _name;
		infinite = _isInfinite;
		if (_isPositive) multiplier = 1;
		else multiplier = -1;
		duration = _duration;
		stat = _stat;
		scale = _scale;
	}
	if (!_stackable){
		var _check = CheckForExistingBuffs(_list, _name)
		if (_check == -1){
			ds_list_add(_list, _inst);
		}
		else {
			ds_list_insert(_list,_check,_inst);
		}
	}
	else {
		ds_list_add(_list, _inst);
	}
	
	return _inst;
}

function CleanBuffs(_list){
	var i = ds_list_size(_list) - 1;
	while(i >= 0 and !ds_list_empty(_list)){
		if (_list[|i].isOver()) {
			var _i = _list[|i];
			ds_list_delete(_list, i);
			instance_destroy(_i);
		}
		else i--;
	}
}

function GetBuffByType(_list, _type){
	var _buff = 1;
	for (var i = 0; i < ds_list_size(_list); i++){
		if (_list[|i].stat == _type) _buff += _list[|i].scale;
	}
	return max(0.1,_buff);
}

