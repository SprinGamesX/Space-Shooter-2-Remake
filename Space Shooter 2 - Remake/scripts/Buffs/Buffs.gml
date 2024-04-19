// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ApplyBuff(_name ,_isInfinite, _isPositive, _stat, _scale, _duration){
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
	return _inst;
}

function CleanBuffs(_list){
	var i = array_length(_list) - 1;
	while(i >= 0){
		if (_list[i].isOver()) array_delete(_list, i, 1);
		else i--;
	}
}

function GetBuffByType(_list, _type){
	var _buff = 1;
	for (var i = 0; i < array_length(_list); i++){
		if (_list[i].stat == _type) _buff += _list[i].scale;
	}
	return max(0.1,_buff);
}