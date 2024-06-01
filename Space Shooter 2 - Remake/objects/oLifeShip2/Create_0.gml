/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

enhanced = 0;

onBasicAttack = function(){
	if (enhanced){
		CreateProjectile(oLifePlank, self, x, y + 16, 12, 0, ATTACK_TYPE.SKILL, element,,,2);
		CreateProjectile(oLifePlank, self, x, y - 16, 12, 0, ATTACK_TYPE.SKILL, element,,,2);
	}
	else CreateProjectile(oLifePlank, self, x, y, 7, 0, ATTACK_TYPE.BASIC_ATTACK, element);
	ammo--;
}

// Skill attack
onSkillAttack = function(){
	GenerateEnergy(self, 10);
	ConsumeHp(self, base_hp * 0.4);
	enhanced = seconds(10);
	
	if (passives[0]) ApplyBuff(self, "Cutting Bonds", false, true, STAT.ASPD, 0.5, seconds(10),,,,true);
}

// Ultimate attack
onUltimateAttack = function(){
	energy = 0;
	ConsumeHp(self, getMaxHp()/2);
	ApplyShield(self, getMaxHp()/4);
}

onBasicHit = function(_enemy){
	var _extra = 0;
	return (getAtk() * (base_ba_scale + _extra));
}
onSkillHit = function(_enemy){
	var _extra = 0;
	
	ApplyBuff(self, "Dying Will", false, true, STAT.DMG,((getMaxHp()/hp) - 1), 1);
	if (passives[2] and hp < getMaxHp()/4) ApplyBuff(self, "Dying Will2", false, true, STAT.DEF_PEN, 0.2, 1);
	
	if (passives[1]) RestoreAmmo(self, 1);
	
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * (base_ba_scale + _extra) + (base_hp * (1 + GetBuffByType(self, STAT.HP))) * (base_skill_scale + _extra);
}
onUltHit = function(_enemy){
	var _extra = 0;
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * (base_ult_scale + _extra);
}