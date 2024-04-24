/// @description Insert description here
// You can write your code in this editor
CleanBuffs(statuses);

if (active){
	movement();
}

if (energy > max_energy){
	energy = max_energy;
}

// Checks for basic attack / skill / ultimate
if (active){
	if (ammo > 0 and ba_cd == 0 and keyboard_check(global.key_ba)){
		ba_cd = base_ba_cd;
		onBasicAttack();
	}
	if (skill_cd == 0 and keyboard_check(global.key_sk)){
		skill_cd = base_skill_cd;
		onSkillAttack();
	}
	if (energy >= max_energy and keyboard_check(global.key_ut)){
		energy = 0;
		onUltimateAttack();
	}
}


// Cooldowns
if (ba_cd <= 0){
	ba_cd = 0;	
}
else {
	ba_cd -= (base_aspd * (1 + GetBuffByType(statuses, STAT.ASPD)));
}

if (skill_cd <= 0){
	skill_cd = 0;	
}
else {
	skill_cd --;
}
if (ammo <= 0){
	if (reload_cd > 0){
		reload_cd--;
	}
	else {
		reload_cd = base_reload_cd;
		ammo = base_ammo;
	}
}

// Debug
if (keyboard_check_pressed(ord("K"))){
	ApplyBuff(statuses,"Test", false, true, STAT.ASPD, 1, seconds(5));
	show_debug_message("Buffed ASPD +100%");
}

