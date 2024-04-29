/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

onBasicAttack = function(){
	CreateProjectile(oVenomVirus, self, x, y, 10, 0, ATTACK_TYPE.BASIC_ATTACK, element);
	ammo--;
}

