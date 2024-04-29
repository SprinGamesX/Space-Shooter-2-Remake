/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

onBasicAttack = function(){
	CreateProjectile(oLightningCharge1, self, x, y, 15, 0, ATTACK_TYPE.BASIC_ATTACK, element,,,4);
	ammo--;
}
