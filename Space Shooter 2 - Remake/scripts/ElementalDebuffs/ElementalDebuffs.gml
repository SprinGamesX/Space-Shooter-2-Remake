// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ApplyPoison(_enemy ,_name , _scale, _duration, _stacks = 1, _owner = self){
	var _list = _enemy.statuses;
	var _inst = instance_create_depth(-100, -100, 999, cStatusPoison);
	var _check = CheckForExistingBuffs(_list, _name);
	
	if (_check == -1){
		with (_inst){
			name = _name;
			duration = _duration;
			max_duration = _duration;
			scale = _scale;
			owner = _owner;
			stack = _stacks;
			reciver = _enemy;
		}
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
	if(_w == 0.25) return 2;
	return 1;
	
}

function ApplyElementalDebuff(_element, _enemy, _owner = self){
	
	var chance = IsEnemyImmune(_element, _enemy.element);
	
	if (_element == ELEMENT.VENOM) and (RollChance(0.75 * chance)){
		ApplyPoison(_enemy,"Poison", 0.2, seconds(1));
	}
	if (_element == ELEMENT.ICE) and (RollChance(0.25 * chance)){
		ApplyDebuff(_enemy, "Frozen",2, false, false, STAT.DMG_RECIVED, 0.02, seconds(5), 5, 1);
		ApplyDebuff(_enemy, "Shiver",2, false, false, STAT.RES, 0.02, seconds(5), 5, 1);
	}
	if (_element == ELEMENT.QUANTUM) and (RollChance(0.01 * chance)){
		CreateDmgIndicator("Entangled", _enemy.x, _enemy.y, ELEMENT.QUANTUM);
		if (!object_is_ancestor(_enemy.object_index, oParentElite)){
			_enemy.y = random_range(64, room_height-64);
			_enemy.x = random_range(_enemy.x, room_width);
		}
		_enemy.hp -= _enemy.base_hp/100;
		
	}
	if (_element == ELEMENT.FIRE) and (RollChance(0.3 * chance) and !_enemy.explosive_immune > 0){
		ApplyDebuff(_enemy, "Explosive",3, true, false, STAT.DMG, -0.05,1,,,_owner);
	}
	if (_element == ELEMENT.LIFE) and (RollChance(0.4 * chance)){
		ApplyDebuff(_enemy, "Sapped",3, false, false, STAT.RES, -0.05,seconds(6),,,_owner);
	}
	if (_element == ELEMENT.LIGHTNING) and (RollChance(0.1 * chance)){
		ApplyDebuff(_enemy, "Shocked",3, false, false, STAT.SPD, 0,seconds(5),,,_owner);
	}
}