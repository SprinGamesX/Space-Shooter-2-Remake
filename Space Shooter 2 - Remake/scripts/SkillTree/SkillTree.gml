// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GetShipTree(_id){
	switch(_id){
		case 0: 
		return [
			// ASC1
			[CHIPSTAT.ATK, 0.1, 1], // OFFENSIVE
			[CHIPSTAT.HP, 0.1, 1], // DEFENSIVE
			// ASC2
			[CHIPSTAT.HP, 0.15, 4], // DEFENSIVE
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
			[CHIPSTAT.ENERGYBOOST, 0.02], // OFFENSIVE
			[CHIPSTAT.HP, 0.15], // OFFENSIVE
			[CHIPSTAT.LIFEDMG, 0.1], // OFFENSIVE (+)
			// ASC3
			[CHIPSTAT.ENERGYBOOST, 0.5], // OFFENSIVE (+)
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
			[CHIPSTAT.CRITRATE, 0.04], // OFFENSIVE (+)
			// ASC3
			[CHIPSTAT.QUANTUMDMG, 0.15], // OFFENSIVE (+)
			[CHIPSTAT.SPD, 0.1], // DEFENSIVE
			[CHIPSTAT.CRITDMG, 0.1], // OFFENSIVE (+)
		];
	}
	return [];
}

function GetTreeForElement(_element){
	
	switch(_element){
		case ELEMENT.ICE:{
			return 
			[
			[0,12,0,10,0,11,0],
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
			[0,12,0,10,0,0,0],
			[0,0,0,0,0,0,0],
			[0,11,0,9,0,7,0],
			[0,0,0,0,4,0,5],
			[0,0,0,8,0,1,2],
			[0,0,0,0,6,3,0]
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
			[0,0,2,1,3,0,0]
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
			[0,8,0,6,0,0,0],
			[11,12,0,0,0,0,0],
			[10,0,0,0,0,0,0],
			[9,0,0,4,0,0,1],
			[0,0,0,0,0,0,2],
			[0,0,0,0,0,0,3],
			[0,0,0,5,0,7,0]
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
	if (_num < 4) return 10;
	if (_num < 9) return 20;
	if (_num < 13) return 30;
}