/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// main stats
is_boss = true;
lv = 1;
base_hp = 0;
base_dmg = 0;
base_spd = 0;
base_res = 0;
base_def = 0;
leader = noone;
element = ELEMENT.NONE;
isAttacking = false;

// dynamic stats
hp = base_hp;

// Attacks
attackQueue = ds_queue_create();
attack_cd = 0;
max_attack_cd = 0;

onAttackFinish = function(){
	isAttacking = false;
}
