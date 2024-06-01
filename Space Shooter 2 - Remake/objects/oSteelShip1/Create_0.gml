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
	if (passives[1]) ApplyTeamShield(getMaxHp() * 0.05);

}

// Ultimate attack
onUltimateAttack = function(){
	energy = 0;
	ApplyTeamShield(getMaxHp() / 4);

}

onHit = function(_enemy){
	if (shield > 0 and passives[0]){
		ApplyBuff(self, "Offensive Defense",false, true, STAT.CRIT, 0.2, 1);
	}
	GenerateEnergy(self, 0.5);
	ApplyElementalDebuff(element, _enemy);	
	if (passives[2] and shield <= 0){
		ApplyShield(self, getMaxHp() * 0.01);
	} 
}