/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

onBasicAttack = function(){
	CreateProjectile(oIceShard1, self, x, y, 10, 0, 0, ATTACK_TYPE.BASIC_ATTACK);
	ammo--;
	
}

onSkillAttack = function(){
	CreateProjectile(oIceShard1, self, x, y, 10, 5, 0, ATTACK_TYPE.SKILL);
	CreateProjectile(oIceShard1, self, x, y, 10, -5, 0, ATTACK_TYPE.SKILL);
	energy += 15;
}
