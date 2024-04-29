// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ApplyPoison(_enemy ,_name , _scale, _duration, _stacks = 1, _owner = self){
	var _list = _enemy.statuses;
	var _inst = instance_create_depth(-100, -100, 999, cStatusPoison);
	var _check = CheckForExistingBuffs(_list, _name);
	with (_inst){
		name = _name;
		duration = _duration;
		max_duration = _duration;
		scale = _scale;
		owner = _owner;
		stack = _stacks;
		reciver = _enemy;
	}
	if (_check == -1){
		ds_list_add(_list, _inst);
	}
	// if buff exists
	else{
		_inst = _list[| _check];
		_inst.addStack(_stacks, _duration);
	}
	return _inst;
}