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
	energy += 10;
	RestoreHp(self, base_hp * 0.25);
}

// Ultimate attack
onUltimateAttack = function(){
	energy = 0;
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