// Inherit the parent event
event_inherited();


onBasicAttack = function(){
	CreateProjectile(oFireBall1, self, x, y, 5, random_range(-10, 10), ATTACK_TYPE.BASIC_ATTACK, element);
	ammo--;
}

onSkillAttack = function(){
	energy += 10;
	ApplyBuff(statuses, "Fired up", false, true, STAT.ASPD, 2, seconds(10));
}
