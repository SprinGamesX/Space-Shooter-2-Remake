/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (attack_cd == 0 and (ds_queue_head(attackQueue) != undefined) and !isAttacking){
	var _attack = ds_queue_dequeue(attackQueue);
	_attack.activate();
	attack_cd = max_attack_cd;
	isAttacking = true;
}
if (attack_cd > 0){
	attack_cd--;
}