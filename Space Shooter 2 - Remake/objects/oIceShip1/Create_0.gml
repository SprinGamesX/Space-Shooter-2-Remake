/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

onBasicAttack = function(){
	CreateProjectile(oIceShard1, self, x, y, 10, 0, ATTACK_TYPE.BASIC_ATTACK, element);
	ammo--;
	
}

onSkillAttack = function(){
	CreateProjectile(oIceShard1, self, x, y, 10, 5, ATTACK_TYPE.SKILL, element,,true);
	CreateProjectile(oIceShard1, self, x, y, 10, -5, ATTACK_TYPE.SKILL, element,,true);
	energy += 15;
}
