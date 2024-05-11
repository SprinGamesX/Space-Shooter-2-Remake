/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

entangled = false;
entangled_timer = 0;

onBasicAttack = function(){
	CreateProjectile(oQuantumOrbs1, self, x, y, 15, 0, ATTACK_TYPE.BASIC_ATTACK, element,,,,,true);
	ammo--;
}

onSkillAttack = function(){
	GenerateEnergy(self, 10);
	for (var i = 0; i < 10; i++){
		CreateProjectile(oQuantumOrbs1, self, x, y, 15, random(360), ATTACK_TYPE.SKILL, element,,,,,true);
	}
}

// Ultimate attack
onUltimateAttack = function(){
	energy = 0;
	entangled = true;
	entangled_timer = seconds(20);
}

onBasicHit = function(_enemy){
	var _extra = 0;
	if (entangled)
		CreateProjectile(oQuantumOrbs1, self, x, y, 15, random(360), ATTACK_TYPE.ULTIMATE, element,,,,,true);
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * (base_ba_scale + _extra);
}

onSkillHit = function(_enemy){
	var _extra = 0;
	if (object_is_ancestor(_enemy.object_index, oParentElite)){
		ApplyTeamBuff("Glitched", false, true, STAT.CRITDMG, 0.05, seconds(10), 10);
	}
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * (base_skill_scale + _extra);
}