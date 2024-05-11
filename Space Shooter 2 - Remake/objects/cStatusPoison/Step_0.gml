/// @description Insert description here
// You can write your code in this editor

duration--;

if (instance_exists(reciver) and instance_exists(owner) and duration <= 0){
	var attacker = owner;
	
	// each stack adds 10% dmg
	var base_dmg = (stack * 0.1) * scale * attacker.getAtk();
	
	// Enemy def calculation
	var def = (5000 - (reciver.base_def + (reciver.base_def * (1 + GetBuffByType(reciver, STAT.DEF) - GetBuffByType(attacker, STAT.DEF_PEN)))))/5000
	
	// Enemy - Attacker advantage
	var _dmg_dealt = (base_dmg) * (1 + GetBuffByType(attacker, STAT.DMG)) * (1 - (reciver.base_res + GetBuffByType(reciver, STAT.RES))) * (1 + IsElementStrong(ELEMENT.VENOM, reciver.element)) * (def);
	
	
	reciver.hp -= _dmg_dealt;
	
	CreateDmgIndicator(string(_dmg_dealt) + "P", reciver.x, reciver.y, ELEMENT.VENOM);
	
	// reduce stacks
	duration = max_duration;
	stack--;
	if (stack <= 0) instance_destroy();
}