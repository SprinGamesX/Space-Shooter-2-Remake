// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function IsElementStrong(_attacker_elem, _defender_elem){
	if (_attacker_elem == _defender_elem) return -0.5;
	switch(_attacker_elem){
		case ELEMENT.ICE:
			if (_defender_elem == ELEMENT.FIRE
			 or _defender_elem == ELEMENT.LIGHTNING
			 or _defender_elem == ELEMENT.STEEL) 
			 return 0.25;
			 break;
			 
		case ELEMENT.FIRE:
			if (_defender_elem == ELEMENT.ICE
			 or _defender_elem == ELEMENT.LIFE
			 or _defender_elem == ELEMENT.STEEL) 
			 return 0.25;
			 break;
			 
		case ELEMENT.LIFE:
			if (_defender_elem == ELEMENT.ICE
			 or _defender_elem == ELEMENT.VENOM
			 or _defender_elem == ELEMENT.LIGHTNING) 
			 return 0.25;
			 break;
			 
		case ELEMENT.VENOM:
			if (_defender_elem == ELEMENT.ICE
			 or _defender_elem == ELEMENT.FIRE
			 or _defender_elem == ELEMENT.LIFE) 
			 return 0.25;
			 break;
			 
		case ELEMENT.LIGHTNING:
			if (_defender_elem == ELEMENT.FIRE
			 or _defender_elem == ELEMENT.VENOM
			 or _defender_elem == ELEMENT.STEEL) 
			 return 0.25;
			 break;
			 
		case ELEMENT.STEEL:
			if (_defender_elem == ELEMENT.LIGHTNING
			 or _defender_elem == ELEMENT.LIFE
			 or _defender_elem == ELEMENT.VENOM)
			 return 0.25;
			 break;
	}
	return 0;
}

function GetDefense(_attacker, _defender){
	return max((5000 - (_defender.base_def * ((1 + GetBuffByType(_defender, STAT.DEF) - GetBuffByType(_attacker, STAT.DEF_PEN)))))/5000, 0);
}

function GetFinalDamage(_attacker, _defender, _base_dmg, _def, _crit, _atktype){
	return 
	(_base_dmg) * 
	(1 + GetBuffByType(_attacker, STAT.DMG) - GetBuffByType(_defender, STAT.DMG_RECIVED) + GetElementalBuff(_attacker, _attacker.element) + GetAttackTypeBuff(_attacker, _atktype)) * 
	(1 + _crit) * 
	(1 - min(_defender.base_res + GetBuffByType(_defender, STAT.RES) + GetElementalRes(_defender, _attacker.element) - GetBuffByType(_attacker, STAT.RES_PEN), 1)) * 
	(1 + IsElementStrong(_attacker.element, _defender.element)) * 
	(_def);
}