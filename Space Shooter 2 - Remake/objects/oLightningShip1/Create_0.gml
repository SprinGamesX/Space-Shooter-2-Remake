// Inherit the parent event
event_inherited();

enhanced = false;
enhanced_timer = 0;
timer_max = seconds(10);
part = GetTrailByElement(element);

onBasicAttack = function(){
	if (enhanced){
		CreateProjectile(oLightningCharge1, self, x, y, 10, 0, ATTACK_TYPE.BASIC_ATTACK, element, 3, ,2,true);	
	}
	else CreateProjectile(oLightningCharge1, self, x, y, 7, 0, ATTACK_TYPE.BASIC_ATTACK, element, 1);
	ammo--;
}

// Skill attack
onSkillAttack = function(){
	GenerateEnergy(self, 10);
	enhanced = true;
	enhanced_timer = timer_max;
}

// Ultimate attack
onUltimateAttack = function(){
	energy = 0;
	if (enhanced){
		for (var i = 90; i > -91; i-= 20)
			CreateProjectile(oLightningCharge1, self, x, y, 15, i, ATTACK_TYPE.ULTIMATE, element, 15,true);
	}
	else {
		for (var i = 90; i > -91; i-= 30)
			CreateProjectile(oLightningCharge1, self, x, y, 15, i, ATTACK_TYPE.ULTIMATE, element, 15,true);
	}
}

// called once the ship hits an enemy
onHit = function(_enemy){
	GenerateEnergy(self, 0.5);
	ApplyElementalDebuff(element, _enemy);
}