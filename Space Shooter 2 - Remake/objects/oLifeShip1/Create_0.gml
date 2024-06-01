/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

onBasicAttack = function(){
	CreateProjectile(oLifeBud, self, x, y, 4, 0, ATTACK_TYPE.BASIC_ATTACK, element,,true);
	ConsumeHp(self, base_hp * 0.01);
	ammo--;
	
}

// Skill attack
onSkillAttack = function(){
	GenerateEnergy(self, 10);
	if (passives[0]) RestoreTeamHp(base_hp * 0.1, self);
	RestoreHp(self, base_hp * 0.15, self);
	
}

// Ultimate attack
onUltimateAttack = function(){
	energy = 0;
	RestoreTeamHp(base_hp * 0.5, self);
	if (passives[2]) ApplyTeamHoT(self, 0.05, seconds(1), 5, "Sprout", true);
	
	var _team = oTeamManager.getInactiveShips();
	for (var i = 0; i < 2; i++){
		_team[i].onAllyUlt(self);
	}

}

onHpRestoration = function(_amount){
	GenerateEnergy(self, 1);
}

onBasicHit = function(_enemy){
	var _extra = 0;
	return (base_hp * (1 + GetBuffByType(self, STAT.HP))) * (base_ba_scale + _extra);
}
onSkillHit = function(_enemy){
	var _extra = 0;
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * (base_skill_scale + _extra);
}
onUltHit = function(_enemy){
	var _extra = 0;
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * (base_ult_scale + _extra);
}