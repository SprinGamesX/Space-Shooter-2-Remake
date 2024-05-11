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
	ApplyBuff(statuses, "Fired up", false, true, STAT.ASPD, 2, seconds(10));
}

onUltimateAttack = function(){
	energy = 0;
	burning = seconds(10);
}

onHit = function(_enemy){
	GenerateEnergy(self, 0.2);
	ApplyElementalDebuff(element, _enemy);
}