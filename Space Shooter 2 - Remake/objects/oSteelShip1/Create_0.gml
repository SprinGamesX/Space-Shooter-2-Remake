/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

onBasicAttack = function(){
	if (shield > 0){
		CreateProjectile(oSteelBar, self, x, y, 10, 0, ATTACK_TYPE.SKILL, element,,,3);
	}
	else {
		CreateProjectile(oSteelBar, self, x, y, 10, 0, ATTACK_TYPE.BASIC_ATTACK, element);
		ammo--;
	}
}

// Skill attack
onSkillAttack = function(){
	GenerateEnergy(self, 10);
	ApplyShield(self, getMaxHp() / 10);
}

// Ultimate attack
onUltimateAttack = function(){
	energy = 0;
	ApplyTeamShield(getMaxHp() / 4);
}