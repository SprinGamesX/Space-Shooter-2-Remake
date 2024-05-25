// Inherit the parent event
event_inherited();

enhanced = false;
enhanced_timer = 0;
timer_max = seconds(10);
part = GetTrailByElement(element);

onBasicAttack = function(){
	for (var i = -5; i <= 5; i += 5){
		CreateProjectile(oLightningCharge1, self, x, y, 13, i, ATTACK_TYPE.BASIC_ATTACK, element, 1);
	}
	ammo--;
	
	oTeamManager.onTeammateBasic(self);
}

// Skill attack
onSkillAttack = function(){
	GenerateEnergy(self, 10);
	GenerateEnergy(oTeamManager.team[0], 30);

	oTeamManager.onTeammateSkill(self);
}

// Ultimate attack
onUltimateAttack = function(){
	energy = 0;
	ApplyTeamBuff("Charged", false, true, STAT.ENERGYBOOST, 0.25, seconds(20),,,,true);
	GenerateTeamEnergy(70, true);
	if (passives[2]) ApplyTeamBuff("Overclocked", false, true, STAT.UT_BONUS, 0.75, seconds(15),,,,true);
	
	oTeamManager.onTeammateUlt(self);
}

// called once the ship hits an enemy
onHit = function(_enemy){
	
	GenerateEnergy(self, 0.5);
	ApplyElementalDebuff(element, _enemy);
}

onCrit = function(){
	if (passives[0]) GenerateTeamEnergy(1, false);
}

onAllyUlt = function(_ally){
	
	if (passives[1]) GenerateEnergy(self, _ally.max_energy / 20);
}

onBattleBegin = function(){
	ApplyTeamBuff("Motorical Complexity", true, true, STAT.ENERGYBOOST, 0.1, 1);
}