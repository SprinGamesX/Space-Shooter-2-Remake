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
	if (passives[1]){
		ApplyTeamBuff("Leathality2", true, true, STAT.ATK, 0.05, 1, 3,,,true,true);
	}
}

// Ultimate attack
onUltimateAttack = function(){
	energy = 0;
	for (var i = 0; i < 360; i+= 20){
		CreateProjectile(oVenomVirus, self, x, y, 10, i, ATTACK_TYPE.ULTIMATE, element);
	}
}

onUltHit = function(_enemy){
	var _extra = 0;
	if (passives[2]) ApplyDebuff(_enemy, "Bitten", false, false, STAT.DEF, 0.1, seconds(20),,,,true);
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * (base_ult_scale + _extra);
}

onBattleBegin = function(){
	show_debug_message("Buffed")
	if (passives[0]) ApplyTeamBuff("Infused", true, true, STAT.ATK, 0.15, 1,,,,true);
	else ApplyTeamBuff("Infused", true, true, STAT.ATK, 0.1, 1,,,,true);
}