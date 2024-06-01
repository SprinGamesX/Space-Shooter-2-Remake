// Inherit the parent event
event_inherited();


onBasicAttack = function(){
	
	CreateProjectile(oFireBall1, self, x, y + 10, 5, 0, ATTACK_TYPE.BASIC_ATTACK, element);
	CreateProjectile(oFireBall1, self, x, y - 10, 5, 0, ATTACK_TYPE.BASIC_ATTACK, element);
	ammo--;
	
}

onSkillAttack = function(){
	GenerateEnergy(self, 10);
	RestoreTeamAmmo(30);
	if (passives[0]){
		ApplyTeamBuff("Fire Supply", false, true, STAT.ASPD, 0.25, seconds(15),,,,true,true);
	}
	
}

onUltimateAttack = function(){
	energy = 0;
	ApplyTeamBuff("Blazing Type-1", false, true, STAT.ASPD, 0.1, seconds(20),,,,true);
	ApplyTeamBuff("Blazing Type-2", false, true, STAT.MAX_AMMO, 20, seconds(20),,,,true);
	ApplyTeamBuff("Blazing Type-3", false, true, STAT.DMG, 0.2, seconds(20),,,,true);
	
	if (passives[1]) GenerateEnergy(self, 10);
	
}

onBattleBegin = function(){
	sprite_index = sFireShip2_animated;
	
	if (passives[2]) ApplyBuff(self, "Blazing Speed", true, true, STAT.SPD, 0.25, 1);
}

onKill = function(){
	RestoreTeamAmmo(5);
}