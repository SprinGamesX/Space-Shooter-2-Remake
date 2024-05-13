/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();



onBasicAttack = function(){
	CreateProjectile(oVenomVirus, self, x, y, 10, 0, ATTACK_TYPE.BASIC_ATTACK, element);
	ammo--;
}

// Skill attack
onSkillAttack = function(){
	GenerateEnergy(self, 10);
	ammo = 0;
	ApplyBuff(self, "Leathality", true, true, STAT.ATK, 0.5, 1, 3,,,true);
}

// Ultimate attack
onUltimateAttack = function(){
	energy = 0;
	for (var i = 0; i < 360; i+= 20){
		CreateProjectile(oVenomVirus, self, x, y, 10, i, ATTACK_TYPE.ULTIMATE, element);
	}
}

onBattleBegin = function(){
	ApplyTeamBuff("Infused", true, true, STAT.ATK, 0.1, 1);
}