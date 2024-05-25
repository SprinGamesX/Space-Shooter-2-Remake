// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GetShipTree(_id){
	switch(_id){
		case 0: 
		return [
			// ASC1
			[CHIPSTAT.ATK, 0.1], // OFFENSIVE
			[CHIPSTAT.HP, 0.1], // DEFENSIVE
			// ASC2
			[CHIPSTAT.HP, 0.15], // DEFENSIVE
			[CHIPSTAT.ICEDMG, 0.05], // OFFENSIVE
			[CHIPSTAT.ATK, 0.15, 5], // OFFENSIVE
			[CHIPSTAT.CRITRATE, 0.03], // OFFENSIVE (+)
			// ASC3
			[CHIPSTAT.ICEDMG, 0.15], // OFFENSIVE (+)
			[CHIPSTAT.RES, 0.03, 9], // DEFENSIVE
			[CHIPSTAT.CRITRATE, 0.05], // OFFENSIVE (+)
		];
		case 1: 
		return [
			// ASC1
			[CHIPSTAT.ATK, 0.1], // OFFENSIVE
			[CHIPSTAT.HP, 0.1], // DEFENSIVE
			// ASC2
			[CHIPSTAT.HP, 0.15], // DEFENSIVE
			[CHIPSTAT.FIREDMG, 0.05], // OFFENSIVE
			[CHIPSTAT.ATK, 0.15], // OFFENSIVE
			[CHIPSTAT.CRITDMG, 0.06], // OFFENSIVE (+)
			// ASC3
			[CHIPSTAT.FIREDMG, 0.15], // OFFENSIVE (+)
			[CHIPSTAT.RES, 0.03], // DEFENSIVE
			[CHIPSTAT.CRITDMG, 0.1], // OFFENSIVE (+)
		];
		case 2: 
		return [
			// ASC1
			[CHIPSTAT.LIFEDMG, 0.05], // OFFENSIVE
			[CHIPSTAT.HP, 0.1], // DEFENSIVE
			// ASC2
			[CHIPSTAT.HP, 0.15], // DEFENSIVE
			[CHIPSTAT.HEALINGBONUS, 0.05], // OFFENSIVE
			[CHIPSTAT.HP, 0.15], // OFFENSIVE
			[CHIPSTAT.LIFEDMG, 0.1], // OFFENSIVE (+)
			// ASC3
			[CHIPSTAT.HEALINGBONUS, 0.1], // OFFENSIVE (+)
			[CHIPSTAT.RES, 0.05], // DEFENSIVE
			[CHIPSTAT.HP, 0.2], // OFFENSIVE (+)
		];
		case 3: 
		return [
			// ASC1
			[CHIPSTAT.ATK, 0.1], // OFFENSIVE
			[CHIPSTAT.HP, 0.05], // DEFENSIVE
			// ASC2
			[CHIPSTAT.HP, 0.10], // DEFENSIVE
			[CHIPSTAT.VENOMDMG, 0.05], // OFFENSIVE
			[CHIPSTAT.ATK, 0.15], // OFFENSIVE
			[CHIPSTAT.SPD, 0.05], // OFFENSIVE (+)
			// ASC3
			[CHIPSTAT.VENOMDMG, 0.15], // OFFENSIVE (+)
			[CHIPSTAT.ATK, 0.2], // DEFENSIVE
			[CHIPSTAT.SPD, 0.1], // OFFENSIVE (+)
		];
		case 4: 
		return [
			// ASC1
			[CHIPSTAT.ATK, 0.1], // OFFENSIVE
			[CHIPSTAT.HP, 0.1], // DEFENSIVE
			// ASC2
			[CHIPSTAT.HP, 0.1], // DEFENSIVE
			[CHIPSTAT.LIGHTNINGDMG, 0.05], // OFFENSIVE
			[CHIPSTAT.ATK, 0.15], // OFFENSIVE
			[CHIPSTAT.CRITRATE, 0.03], // OFFENSIVE (+)
			// ASC3
			[CHIPSTAT.LIGHTNINGDMG, 0.15], // OFFENSIVE (+)
			[CHIPSTAT.SPD, 0.15], // DEFENSIVE
			[CHIPSTAT.CRITRATE, 0.05], // OFFENSIVE (+)
		];
		case 5: 
		return [
			// ASC1
			[CHIPSTAT.RES, 0.01], // OFFENSIVE
			[CHIPSTAT.HP, 0.1], // DEFENSIVE
			// ASC2
			[CHIPSTAT.HP, 0.1], // DEFENSIVE
			[CHIPSTAT.STEELDMG, 0.05], // OFFENSIVE
			[CHIPSTAT.RES, 0.04], // OFFENSIVE
			[CHIPSTAT.STEELDMG, 0.08], // OFFENSIVE (+)
			// ASC3
			[CHIPSTAT.STEELDMG, 0.12], // OFFENSIVE (+)
			[CHIPSTAT.SPD, 0.1], // DEFENSIVE
			[CHIPSTAT.RES, 0.05], // OFFENSIVE (+)
		];
		case 6: 
		return [
			// ASC1
			[CHIPSTAT.ATK, 0.1], // OFFENSIVE
			[CHIPSTAT.HP, 0.1], // DEFENSIVE
			// ASC2
			[CHIPSTAT.HP, 0.1], // DEFENSIVE
			[CHIPSTAT.QUANTUMDMG, 0.05], // OFFENSIVE
			[CHIPSTAT.ATK, 0.15], // OFFENSIVE
			[CHIPSTAT.CRITRATE, 0.05], // OFFENSIVE (+)
			// ASC3
			[CHIPSTAT.QUANTUMDMG, 0.15], // OFFENSIVE (+)
			[CHIPSTAT.SPD, 0.1], // DEFENSIVE
			[CHIPSTAT.CRITRATE, 0.1], // OFFENSIVE (+)
		];
		case 7: 
		return [
			// ASC1
			[CHIPSTAT.ATK, 0.1], // OFFENSIVE
			[CHIPSTAT.HP, 0.1], // DEFENSIVE
			// ASC2
			[CHIPSTAT.HP, 0.1], // DEFENSIVE
			[CHIPSTAT.LIGHTNINGDMG, 0.05], // OFFENSIVE
			[CHIPSTAT.ATK, 0.15], // OFFENSIVE
			[CHIPSTAT.ENERGYBOOST, 0.05], // OFFENSIVE (+)
			// ASC3
			[CHIPSTAT.LIGHTNINGDMG, 0.15], // OFFENSIVE (+)
			[CHIPSTAT.SPD, 0.1], // DEFENSIVE
			[CHIPSTAT.ENERGYBOOST, 0.1], // OFFENSIVE (+)
		];
	}
	return [];
}

function GetTreeForElement(_element){
	
	switch(_element){
		case ELEMENT.ICE:{
			return 
			[
			[12,0,0,10,0,0,11],
			[0,0 ,0,9 ,0,0 ,0],
			[0,0 ,0,0 ,0,0 ,0],
			[6,0 ,0,4 ,0,0 ,5],
			[0,0 ,0,0 ,0,0 ,0],
			[0,3 ,0,1 ,0,2 ,0],
			[8,0 ,0,0 ,0,0 ,7]
			];
		}
		case ELEMENT.FIRE:{
			return 
			[
			[0,0,0,0,0,0,0],
			[0,0,0,10,0,0,0],
			[0,0,0,0,0,0,0],
			[0,11,0,9,0,12,0],
			[0,0,8,0,0,0,0],
			[0,0,6,4,0,1,2],
			[0,0,0,5,7,3,0]
			];
		}
		case ELEMENT.LIFE:{
			return 
			[
			[11,0,0,9,0,10,12],
			[0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0],
			[8,6,0,4,0,5,7],
			[0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0],
			[2,0,0,1,0,0,3]
			];
		}
		case ELEMENT.VENOM:{
			return 
			[
			[12,0,0,11,0,0,0],
			[10,0,0,9,0,0,0],
			[0,0,0,0,0,0,0],
			[0,6,0,4,0,5,0],
			[0,0,0,0,0,0,0],
			[0,8,0,0,0,7,0],
			[0,0,3,1,2,0,0]
			];
		}
		case ELEMENT.LIGHTNING:{
			return 
			[
			[0,0,12,0,6,0,8],
			[0,0,0,0,0,0,0],
			[11,0,9,0,4,5,0],
			[0,0,0,0,0,7,0],
			[0,0,10,0,0,0,0],
			[0,0,0,0,1,0,0],
			[0,3,0,0,2,0,0]
			];
		}
		case ELEMENT.QUANTUM:{
			return 
			[
			[0,11,10,9,0,0,0],
			[8,12,0,0,0,0,0],
			[0,0,0,0,0,0,0],
			[6,0,0,4,0,0,5],
			[0,0,0,0,0,0,0],
			[0,0,0,0,0,3,7],
			[0,0,0,1,0,2,0]
			];
		}
		case ELEMENT.STEEL:{
			return 
			[
			[0,12,0,10,0,11,0],
			[0,0,0,9,0,0,0],
			[6,0,0,4,0,0,5],
			[0,0,0,0,0,0,0],
			[8,0,0,0,0,0,7],
			[0,0,0,0,0,0,0],
			[0,0,3,1,2,0,0]
			];
		}
	}
	
}

function FindXYInST(_st, _num){
	for (var i = 0; i < 7; i++){
		for (var j = 0; j < 7; j++){
			if (_st[j][i] == _num) return [i,j];
		}
	}
}

function FindDependency(_element,_num){
	if (_element == ELEMENT.ICE or _element = ELEMENT.FIRE){
		if (_num == 2 or _num == 3 or _num == 4) return 1;
		if (_num == 5 or _num == 6 or _num == 9) return 4;
		if (_num == 7) return 5;
		if (_num == 8) return 6;
		if (_num == 10 or _num == 11 or _num == 12) return 9;
	}
	if (_element == ELEMENT.LIFE or _element = ELEMENT.VENOM){
		if (_num == 2 or _num == 3 or _num == 4) return 1;
		if (_num == 5 or _num == 6 or _num == 9) return 4;
		if (_num == 7) return 5;
		if (_num == 8) return 6;
		if (_num == 10 or _num == 11) return 9;
		if (_num == 12) return 10;
	}
	if (_element == ELEMENT.LIGHTNING){
		if (_num == 2 or _num == 4) return 1;
		if (_num == 3) return 2;
		if (_num == 5 or _num == 6 or _num == 9) return 4;
		if (_num == 7) return 5;
		if (_num == 8) return 6;
		if (_num == 10 or _num == 11 or _num == 12) return 9;
	}
	if (_element == ELEMENT.STEEL){
		if (_num == 2 or _num == 3 or _num == 4) return 1;
		if (_num == 5 or _num == 6 or _num == 9) return 4;
		if (_num == 7) return 5;
		if (_num == 8) return 6;
		if (_num == 10) return 9;
		if (_num == 11 or _num == 12) return 10;
	}
	if (_element == ELEMENT.QUANTUM){
		if (_num == 2 or _num == 4) return 1;
		if (_num == 3) return 2;
		if (_num == 5 or _num == 6 or _num == 9) return 4;
		if (_num == 7) return 5;
		if (_num == 8) return 6;
		if (_num == 10 or _num == 11 or _num == 12) return _num-1;
	}
	return 0;
}

function GetCostForSTNode(_num){
	if (_num == 1) return 50;
	if (_num == 4) return 150;
	if (_num == 9) return 600;
	if (_num < 4) return 25;
	if (_num < 9) return 75;
	if (_num < 13) return 125;
}

function GetSTStat(_id, _stat){
	var _st = GetShipTree(_id);
	var _arr = array_create(9);
	var _buff = 0;
	for (var i = 0; i < 13; i++){
		if (i < 4 and i > 1){
			_arr[i] = global.shipST[_id][i-2];
		}
		else if (i > 4 and i > 9){
			_arr[i] = global.shipST[_id][i-3];
		}
		else if (i > 9){
			_arr[i] = global.shipST[_id][i-4];
		}
	}
	for (var i = 0; i < 9; i++){
		if (_arr[i] and _st[i][0] == _stat) _buff += _st[i][1];
	}
	return _buff;
}

function GetSTMovement(_element, _index, _direc){
	var i = 0;
	switch(_element){
		case ELEMENT.ICE: 
			switch(_index){
				case 1: switch(_direc){ case DIRECTION.LEFT: i = 3; break;  case DIRECTION.RIGHT: i = 2; break; case DIRECTION.UP: i = 4; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 2: switch(_direc){ case DIRECTION.LEFT: i = 1; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 3: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 1; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 4: switch(_direc){ case DIRECTION.LEFT: i = 6; break;  case DIRECTION.RIGHT: i = 5; break; case DIRECTION.UP: i = 9; break; case DIRECTION.DOWN: i = 1; break;} break;
				case 5: switch(_direc){ case DIRECTION.LEFT: i = 4; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 7; break;} break;
				case 6: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 4; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 8; break;} break;
				case 7: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 5; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 8: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 6; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 9: switch(_direc){ case DIRECTION.LEFT: i = 12; break;  case DIRECTION.RIGHT: i = 11; break; case DIRECTION.UP: i = 10; break; case DIRECTION.DOWN: i = 4; break;} break;
				case 10: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 9; break;} break;
				case 11: switch(_direc){ case DIRECTION.LEFT: i = 9; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 9; break;} break;
				case 12: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 9; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 9; break;} break;
			}
		break;
		case ELEMENT.FIRE:
			switch(_index){
				case 1: switch(_direc){ case DIRECTION.LEFT: i = 4; break;  case DIRECTION.RIGHT: i = 2; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 3; break;} break;
				case 2: switch(_direc){ case DIRECTION.LEFT: i = 1; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 3: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 1; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 4: switch(_direc){ case DIRECTION.LEFT: i = 6; break;  case DIRECTION.RIGHT: i = 1; break; case DIRECTION.UP: i = 9; break; case DIRECTION.DOWN: i = 5; break;} break;
				case 5: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 7; break; case DIRECTION.UP: i = 4; break; case DIRECTION.DOWN: i = 7; break;} break;
				case 6: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 4; break; case DIRECTION.UP: i = 8; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 7: switch(_direc){ case DIRECTION.LEFT: i = 5; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 8: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 6; break;} break;
				case 9: switch(_direc){ case DIRECTION.LEFT: i = 11; break;  case DIRECTION.RIGHT: i = 12; break; case DIRECTION.UP: i = 10; break; case DIRECTION.DOWN: i = 4; break;} break;
				case 10: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 9; break;} break;
				case 11: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 9; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 12: switch(_direc){ case DIRECTION.LEFT: i = 9; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
			}
		break;
		case ELEMENT.LIFE:
			switch(_index){
				case 1: switch(_direc){ case DIRECTION.LEFT: i = 2; break;  case DIRECTION.RIGHT: i = 3; break; case DIRECTION.UP: i = 4; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 2: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 1; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 3: switch(_direc){ case DIRECTION.LEFT: i = 1; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 4: switch(_direc){ case DIRECTION.LEFT: i = 6; break;  case DIRECTION.RIGHT: i = 5; break; case DIRECTION.UP: i = 9; break; case DIRECTION.DOWN: i = 1; break;} break;
				case 5: switch(_direc){ case DIRECTION.LEFT: i = 4; break;  case DIRECTION.RIGHT: i = 7; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 6: switch(_direc){ case DIRECTION.LEFT: i = 8; break;  case DIRECTION.RIGHT: i = 4; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 7: switch(_direc){ case DIRECTION.LEFT: i = 5; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 8: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 6; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 9: switch(_direc){ case DIRECTION.LEFT: i = 11; break;  case DIRECTION.RIGHT: i = 10; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 4; break;} break;
				case 10: switch(_direc){ case DIRECTION.LEFT: i = 9; break;  case DIRECTION.RIGHT: i = 12; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 11: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 9; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 12: switch(_direc){ case DIRECTION.LEFT: i = 10; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
			}
		break;
		case ELEMENT.VENOM:
			switch(_index){
				case 1: switch(_direc){ case DIRECTION.LEFT: i = 3; break;  case DIRECTION.RIGHT: i = 2; break; case DIRECTION.UP: i = 4; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 2: switch(_direc){ case DIRECTION.LEFT: i = 1; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 3: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 1; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 4: switch(_direc){ case DIRECTION.LEFT: i = 6; break;  case DIRECTION.RIGHT: i = 5; break; case DIRECTION.UP: i = 9; break; case DIRECTION.DOWN: i = 1; break;} break;
				case 5: switch(_direc){ case DIRECTION.LEFT: i = 4; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 7; break;} break;
				case 6: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 4; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 8; break;} break;
				case 7: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 5; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 8: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 6; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 9: switch(_direc){ case DIRECTION.LEFT: i = 10; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 11; break; case DIRECTION.DOWN: i = 4; break;} break;
				case 10: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 9; break; case DIRECTION.UP: i = 12; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 11: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 9; break;} break;
				case 12: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 10; break;} break;
			}
		break;
		case ELEMENT.LIGHTNING:
			switch(_index){
				case 1: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 4; break; case DIRECTION.DOWN: i = 2; break;} break;
				case 2: switch(_direc){ case DIRECTION.LEFT: i = 3; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 1; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 3: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 2; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 4: switch(_direc){ case DIRECTION.LEFT: i = 9; break;  case DIRECTION.RIGHT: i = 5; break; case DIRECTION.UP: i = 6; break; case DIRECTION.DOWN: i = 1; break;} break;
				case 5: switch(_direc){ case DIRECTION.LEFT: i = 4; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 7; break;} break;
				case 6: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 8; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 4; break;} break;
				case 7: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 5; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 8: switch(_direc){ case DIRECTION.LEFT: i = 6; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 9: switch(_direc){ case DIRECTION.LEFT: i = 11; break;  case DIRECTION.RIGHT: i = 4; break; case DIRECTION.UP: i = 12; break; case DIRECTION.DOWN: i = 10; break;} break;
				case 10: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 9; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 11: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 9; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 12: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 9; break;} break;
			}
		break;
		case ELEMENT.STEEL:
			switch(_index){
				case 1: switch(_direc){ case DIRECTION.LEFT: i = 3; break;  case DIRECTION.RIGHT: i = 2; break; case DIRECTION.UP: i = 4; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 2: switch(_direc){ case DIRECTION.LEFT: i = 1; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 3: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 1; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 4: switch(_direc){ case DIRECTION.LEFT: i = 6; break;  case DIRECTION.RIGHT: i = 5; break; case DIRECTION.UP: i = 9; break; case DIRECTION.DOWN: i = 1; break;} break;
				case 5: switch(_direc){ case DIRECTION.LEFT: i = 4; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 7; break;} break;
				case 6: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 4; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 8; break;} break;
				case 7: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 5; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 8: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 6; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 9: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 10; break; case DIRECTION.DOWN: i = 4; break;} break;
				case 10: switch(_direc){ case DIRECTION.LEFT: i = 12; break;  case DIRECTION.RIGHT: i = 11; break; case DIRECTION.UP: i = 9; break; case DIRECTION.DOWN: i = 9; break;} break;
				case 11: switch(_direc){ case DIRECTION.LEFT: i = 10; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 12: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 10; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
			}
		break;
		case ELEMENT.QUANTUM:
			switch(_index){
				case 1: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 2; break; case DIRECTION.UP: i = 4; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 2: switch(_direc){ case DIRECTION.LEFT: i = 1; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 3; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 3: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 2; break;} break;
				case 4: switch(_direc){ case DIRECTION.LEFT: i = 6; break;  case DIRECTION.RIGHT: i = 5; break; case DIRECTION.UP: i = 9; break; case DIRECTION.DOWN: i = 1; break;} break;
				case 5: switch(_direc){ case DIRECTION.LEFT: i = 4; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 7; break;} break;
				case 6: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 4; break; case DIRECTION.UP: i = 8; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 7: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 5; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 8: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 6; break;} break;
				case 9: switch(_direc){ case DIRECTION.LEFT: i = 10; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 4; break;} break;
				case 10: switch(_direc){ case DIRECTION.LEFT: i = 11; break;  case DIRECTION.RIGHT: i = 9; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 0; break;} break;
				case 11: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 10; break; case DIRECTION.UP: i = 0; break; case DIRECTION.DOWN: i = 12; break;} break;
				case 12: switch(_direc){ case DIRECTION.LEFT: i = 0; break;  case DIRECTION.RIGHT: i = 0; break; case DIRECTION.UP: i = 11; break; case DIRECTION.DOWN: i = 0; break;} break;
			}
		break;
	}
	return i;
}
