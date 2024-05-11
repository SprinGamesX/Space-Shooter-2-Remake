/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

fua_chance = 0;

onBasicAttack = function(){
	CreateProjectile(oIceShard1, self, x, y, 10, 0, ATTACK_TYPE.BASIC_ATTACK, element);
	ammo--;
}

onSkillAttack = function(){
	for (var i = -15; i <= 15; i += 5)
		CreateProjectile(oIceShard1, self, x, y, 15, i, ATTACK_TYPE.SKILL, element,20);
	GenerateEnergy(self, 5);
	//ApplyBuff(statuses, "Skill", false, true, STAT.CRIT, 0.5, seconds(10));
}
onUltimateAttack = function(){
	CreateProjectile(oIceShard1, self, x, y, 15, 0, ATTACK_TYPE.ULTIMATE, element,4);
	energy = 0;
}

onHit = function(_enemy){
	ApplyElementalDebuff(element, _enemy);
	if (RollChance(fua_chance)){
		CreateProjectile(oIceShard1, self, x, y, 15, random_range(-180, 180), ATTACK_TYPE.FOLLOWUP, element,,true);
		ammo--;
	}
}

onBasicHit = function(){
	var _extra = 0;
	GenerateEnergy(self, 1);
	fua_chance = min(fua_chance+0.01, 0.1);
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * (base_ba_scale + _extra);
}

onSkillHit = function(_enemy){
	var _extra = 0;
	
	ApplyDebuff(_enemy, "Frosted", false, false, STAT.DEF, 0.2, seconds(10),,,,true);
	
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * (base_skill_scale + _extra);
}

onUltHit = function(_enemy){
	var _extra = 0;
	for (var i = 0; i < 2; i++){
		CreateProjectile(oIceShard1, self, x, y, 15, random_range(-180, 180), ATTACK_TYPE.FOLLOWUP, element,,true);
	}
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * (base_ult_scale + _extra);
}

onFollowupHit = function(_enemy){
	var _extra = 0;
	GenerateEnergy(self, 0.2); 
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * ((base_ba_scale/2) + _extra);
}