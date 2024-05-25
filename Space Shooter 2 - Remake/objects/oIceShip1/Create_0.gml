/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

fua_chance = 0;
if (passives[1]) fua_chance = 0.1;

onBasicAttack = function(){
	CreateProjectile(oIceShard1, self, x, y, 10, 0, ATTACK_TYPE.BASIC_ATTACK, element);
	ammo--;

	oTeamManager.onTeammateBasic(self);
}

onSkillAttack = function(){
	for (var i = -15; i <= 15; i += 5)
		CreateProjectile(oIceShard1, self, x, y, 15, i, ATTACK_TYPE.SKILL, element,20);
	GenerateEnergy(self, 5);
	if (passives[0])
		ApplyBuff(self, "Arch Freeze", false, true, STAT.ATK, 0.1, seconds(5),,,,true);

	oTeamManager.onTeammateSkill(self);
}
onUltimateAttack = function(){
	CreateProjectile(oIceShard1, self, x, y, 15, 0, ATTACK_TYPE.ULTIMATE, element,4);
	energy = 0;
	
	var _team = oTeamManager.getInactiveShips();
	for (var i = 0; i < 2; i++){
		_team[i].onAllyUlt(self);
	}
	
	oTeamManager.onTeammateUlt(self);
}

onHit = function(_enemy){
	ApplyElementalDebuff(element, _enemy);
	
}

onBasicHit = function(){
	var _extra = 0;
	GenerateEnergy(self, 1);
	fua_chance = min(fua_chance+0.01, passives[1] ? 0.25 : 0.1);
	if (RollChance(fua_chance)){
		CreateProjectile(oIceShard1, self, x, y, 15, random_range(-180, 180), ATTACK_TYPE.FOLLOWUP, element,,true);
		ammo--;
	}
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * (base_ba_scale + _extra);
}

onSkillHit = function(_enemy){
	var _extra = 0;
	
	ApplyDebuff(_enemy, "Frosted", 0.65,false, false, STAT.DEF, 0.2, seconds(15),,,,true);
	
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
	var _extra = passives[2] ? 0.1 : 0;
	GenerateEnergy(self, 0.2); 
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * ((base_ba_scale/2) + _extra);
}