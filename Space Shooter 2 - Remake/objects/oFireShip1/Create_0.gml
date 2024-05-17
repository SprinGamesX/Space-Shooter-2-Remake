// Inherit the parent event
event_inherited();
burning = 0;


onBasicAttack = function(){
	if (burning)
		CreateProjectile(oFireBall1, self, x, y, 5, random_range(-10, 10), ATTACK_TYPE.ULTIMATE, element,,,2);
	else {
		CreateProjectile(oFireBall1, self, x, y, 5, random_range(-10, 10), ATTACK_TYPE.BASIC_ATTACK, element);
		ammo--;
	}
}

onSkillAttack = function(){
	GenerateEnergy(self, 10);
	ApplyBuff(self, "Fired up", false, true, STAT.ASPD, 2, seconds(10));
	if (passives[1]){
		for (var i = 0; i < 360; i+= 15){
			CreateProjectile(oFireBall1, self, x, y, 5, i, ATTACK_TYPE.SKILL, element);
		}
	}
}

onUltimateAttack = function(){
	energy = 0;
	burning = seconds(10);
	if (passives[0]){
		ApplyBuff(self, "Blazing Defense", false, true, STAT.RES, 0.15, seconds(10),,,,true);
	}
}

onHit = function(_enemy){
	GenerateEnergy(self, 0.2);
	ApplyElementalDebuff(element, _enemy);
}
onEnemyHit = function(_enemy){
	ApplyBuff(self, "Flaming Rage", false, true, STAT.ATK, 0.5, seconds(4),,,,true);
	var _res = 0;
	if (element == ELEMENT.STEEL) and (RollChance(0.25)){
		_res = 0.5;
		CreateDmgIndicator("Blocked", x, y, ELEMENT.STEEL);
	}
	GenerateEnergy(self, 2);
	
	if (shield > 0){
		shield -= (_enemy.base_dmg * (1 + GetBuffByType(_enemy, STAT.DMG))) * (1 - GetBuffByType(self, STAT.RES) - _res);
		if (shield < 0) {
			hp += shield;
			onHpReduction(-shield);
		}
	}
	else {
		var _dmg = (_enemy.base_dmg * (1 + GetBuffByType(_enemy, STAT.DMG))) * (1 - GetBuffByType(self, STAT.RES) - _res);
		hp -= _dmg;
		onHpReduction(_dmg);
		
	}
	if (!_enemy.is_boss) instance_destroy(_enemy);
}