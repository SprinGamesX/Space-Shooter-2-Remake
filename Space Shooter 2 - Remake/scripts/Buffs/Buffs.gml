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
		if (instance_exists(_list[|i]) and _list[|i].name == _name) existing++;
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

function ApplyBuff(_target,_name ,_isInfinite, _isPositive, _stat, _scale, _duration, _stacking = 1, _stacks = 1, _owner = self, _show_indicator = false){
	var _list = _target.statuses;
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
		if (_stat == STAT.HEALING_OVER_TIME){
			target = _target;
		}
	}
	// if ship does not have the buff
	if (_check == -1){
		ds_list_add(_list, _inst);
		if (_show_indicator){
			var _xy = oTeamManager.getShipGuiXY(_target);
			CreateBuffIndicator(_isPositive, _stat, _scale,_xy[0], _xy[1]);
		}
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
			if (_show_indicator){
				var _xy = oTeamManager.getShipGuiXY(_target);
				CreateBuffIndicator(_isPositive, _stat, _scale,_xy[0], _xy[1]);
			}
		}
		
	}
	
	return _inst;
}

function ApplyDebuff(_enemy,_name ,_chance,_isInfinite, _isPositive, _stat, _scale, _duration, _stacking = 1, _stacks = 1, _owner = self, _show_indicator = false){
	var _list = _enemy.statuses;
	var _inst = instance_create_depth(-100, -100, 999, cStatus)
	var _check = CheckForExistingBuffs(_list, _name);
	if (RollChance(_chance + GetBuffByType(_owner, STAT.EFFECT_CHANCE) - GetBuffByType(_enemy, STAT.EFFECT_RES))){
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

	}
	else if (_show_indicator) { CreateDmgIndicator("RESIST", _enemy.x, _enemy.y, ELEMENT.NONE); show_debug_message("Resisted") }
	return _inst;
}

function CleanBuffs(_list){
	if (ds_exists(_list, ds_type_list)){
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
		case STAT.ENERGYBOOST: return CHIPSTAT.ENERGYBOOST;
		case STAT.HEALING_BONUS: return CHIPSTAT.HEALINGBONUS;
		case STAT.EFFECT_CHANCE: return CHIPSTAT.EFFECTCHANCE;
		
	}
	return -1;
}

function GetBuffByType(_attacker, _type){
	
	//if (object_is_ancestor(_attacker.object_index, oParentEnemy) and !object_is_ancestor(_attacker.object_index, oParentElite)) _attacker = _attacker.leader;
		if (instance_exists(_attacker)){
		var _buff = 0;
		var _isShip = false;
		var _list = _attacker.statuses;
		if (ds_exists(_list, ds_type_list)){
			if (object_is_ancestor(_attacker.object_index, oParentShip)) _isShip = true;
		
			for (var i = 0; i < ds_list_size(_list); i++){
				if (instance_exists(_list[|i]) and _list[|i].stat == _type) _buff += _list[|i].get();
			}
			if (_isShip){
				var _chips = _attacker.chips;
				var _pbuffs = _attacker.stbuffs;
				var _chipstat = GetChipType(_type);
	
				for (var i = 0; _chipstat != -1 and i < array_length(_chips); i++){
					if (instance_exists(_chips[i])) and (_chips[i].stat == _chipstat) _buff += _chips[i].get();
					if (i < 9) and (is_array(_pbuffs[i])) and (_pbuffs[i][0] == _chipstat) _buff += _pbuffs[i][1];
				}}
			return _buff;
		}
		return 0;
	}
	return 0;
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

function GetElementalRes(_attacker ,_element){
	 
	switch(_element){
		case ELEMENT.ICE: return GetBuffByType(_attacker, STAT.ICERES);
		case ELEMENT.FIRE: return GetBuffByType(_attacker, STAT.FIRERES);
		case ELEMENT.LIGHTNING: return GetBuffByType(_attacker, STAT.LIGHTNINGRES);
		case ELEMENT.LIFE: return GetBuffByType(_attacker, STAT.LIFERES);
		case ELEMENT.VENOM: return GetBuffByType(_attacker, STAT.VENOMRES);
		case ELEMENT.STEEL: return GetBuffByType(_attacker, STAT.STEELRES);
		case ELEMENT.QUANTUM: return GetBuffByType(_attacker, STAT.QUANTUMRES);
	}
}

function GetAttackTypeBuff(_attacker, _type){
	switch(_type){
		case ATTACK_TYPE.BASIC_ATTACK: return GetBuffByType(_attacker, STAT.BA_BONUS);
		case ATTACK_TYPE.SKILL: return GetBuffByType(_attacker, STAT.SK_BONUS);
		case ATTACK_TYPE.ULTIMATE: return GetBuffByType(_attacker, STAT.UT_BONUS);
		case ATTACK_TYPE.FOLLOWUP: return GetBuffByType(_attacker, STAT.FUA_BONUS);
		case ATTACK_TYPE.DOT: return GetBuffByType(_attacker, STAT.DOT_BONUS);
	}
	return 0;
}

function ApplyTeamBuff(_name ,_isInfinite, _isPositive, _stat, _scale, _duration, _stacking = 1, _stacks = 1, _owner = self, _show_indicator = false ,_exlude_owner = false){
	var _team = oTeamManager.getAllShips();
	for (var i = 0; i < array_length(_team); i++){
		if (instance_exists(_team[i])){
			if (_exlude_owner){
				if (_team[i].id != _owner.id){
					ApplyBuff(_team[i], _name ,_isInfinite, _isPositive, _stat, _scale, _duration, _stacking, _stacks, _owner, _show_indicator);
				}
			}
			else {
				ApplyBuff(_team[i], _name ,_isInfinite, _isPositive, _stat, _scale, _duration, _stacking, _stacks, _owner, _show_indicator);
			}
		}
	}
}

function CheckForStatus(_target, _stat){
	return GetBuffByType(_target, _stat) != 0;
}

function CheckForStatusByName(_target, _name){
	var _found = false;
	if (instance_exists(_target) and ds_exists(_target.statuses, ds_type_list)){
		for (var i = 0; i < ds_list_size(_target.statuses) and instance_exists(_target); i++){
			if (instance_exists(_target) and (_target.statuses[|i].name == _name)){
				_found = true;
				break;
			}
		}
	}
	return _found;
}

function RemoveStatusByName(_target, _name){
	var _found = false;
	for (var i = 0; i < ds_list_size(_target.statuses); i++){
		if ((_target.statuses[|i].name == _name)){
			ds_list_delete(_target.statuses, i);
			_found = true;
			break;
		}
	}
	return _found;
}

function ApplyHealOverTime(_target, _owner,_scale,_duration, _stacks, _name, _show_indicator = false){
	var _list = _target.statuses;
	var _inst = instance_create_depth(-100, -100, 999, cHealingOverTime);
	var _check = CheckForExistingBuffs(_list, _name);
	with (_inst){
		name = _name;
		duration = _duration;
		max_duration = _duration;
		scale = _scale;
		owner = _owner;
		max_stack = _stacks;
		stack = _stacks;
		target = _target;
	}
	// if ship does not have the buff
	if (_check == -1){
		ds_list_add(_list, _inst);
		if (_show_indicator){
			var _xy = oTeamManager.getShipGuiXY(_target);
			CreateDmgIndicator("Healing Over Time", _xy[0], _xy[1], ELEMENT.LIFE);
		}
	}
	
	// if buff exists
	else{
		_inst = _list[| _check];
		_inst.addStack(_stacks, _duration);
		if (_show_indicator){
			var _xy = oTeamManager.getShipGuiXY(_target);
			CreateDmgIndicator("Healing Over Time", _xy[0], _xy[1], ELEMENT.LIFE);
		}
		
	}
	
	return _inst;
}

function ApplyTeamHoT(_owner,_scale,_duration, _stacks, _name, _show_indicator = false, _exlude_owner = false){
	var _team = oTeamManager.getAllShips();
	for (var i = 0; i < array_length(_team); i++){
		if (instance_exists(_team[i])){
			if (_exlude_owner){
				if (_team[i].id != _owner.id){
					ApplyHealOverTime(_team[i], _owner, _scale, _duration, _stacks, _name, _show_indicator);
				}
			}
			else {
				ApplyHealOverTime(_team[i], _owner, _scale, _duration, _stacks, _name, _show_indicator);
			}
		}
	}
	
}