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

function IsEnemyImmune(_element, _enemy_element){
	var _w = IsElementStrong(_element, _enemy_element);
	if(_w == -0.5) return 0;
	if(_w == 0.25) return 100;
	return 1;
	
}

function ApplyElementalDebuff(_element, _enemy){
	
	var chance = IsEnemyImmune(_element, _enemy.element);
	
	if (_element == ELEMENT.VENOM) and (RollChance(0.75 * chance)){
		ApplyPoison(_enemy,"Poison", 0.5, seconds(1));
	}
	if (_element == ELEMENT.ICE) and (RollChance(0.5 * chance)){
		ApplyDebuff(_enemy, "Frozen", false, false, STAT.DMG, 0.05, seconds(5), 5, 1);
		ApplyDebuff(_enemy, "Shiver", false, false, STAT.RES, 0.04, seconds(5), 5, 1);
	}
}