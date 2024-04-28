/// @description Insert description here

// base stats (do not change)
base_atk = 0;
base_hp = 0;
base_spd = 3;
base_aspd = 1;
base_ammo = 0;
max_energy = 50;
base_skill_cd = 0;
base_ba_cd = 0;
base_reload_cd = 0;
base_crit = 0.05;
base_critdmg = 1;

InitiateShip(shipId);

// dynamic stats (do change)
energy = 0;
ammo = 0;
active = true;
skill_cd = 0;
ba_cd = 0;
reload_cd = 0;
hp = base_hp;

// list of buffs and nerfs
statuses = ds_list_create();


// called once the ship gets a kill
onKill = function(){
	energy += 5;
}

// called once the ship hits an enemy
onEnemyHit = function(){
	energy += 1;
}

// called once the ship is hit
onHit = function(){
	energy += 2;
}

// Basic attack
onBasicAttack = function(){
	
}

// Skill attack
onSkillAttack = function(){
	energy += 10;
}

// Ultimate attack
onUltimateAttack = function(){
	energy = 0;
}

// called when atk/skill/ult hits; calculates base dmg
onBasicHit = function(_enemy){
	var _extra = 0;
	return (base_atk * (1 + GetBuffByType(statuses, STAT.ATK))) * (base_ba_scale + _extra);
}
onSkillHit = function(_enemy){
	var _extra = 0;
	return (base_atk * (1 + GetBuffByType(statuses, STAT.ATK))) * (base_skill_scale + _extra);
}
onUltHit = function(_enemy){
	var _extra = 0;
	return (base_atk * (1 + GetBuffByType(statuses, STAT.ATK))) * (base_ult_scale + _extra);
}

// Movement
movement = function(){
	var _hMove = keyboard_check(global.key_right) - keyboard_check(global.key_left);
	var _vMove = keyboard_check(global.key_down) - keyboard_check(global.key_up);
	
	if (_hMove != 0){
		var _hsp = _hMove * base_spd * (1 + GetBuffByType(statuses, STAT.SPD));
		if (place_meeting(x + _hsp, y, oBarrier)){
			while(abs(_hsp) > 0.1){
				_hsp *= 0.5;
				if (!place_meeting(x + _hsp, y, oBarrier)) x += _hsp;
			}
			_hsp = 0;
		}
		x += _hsp;
	}
	if (_vMove != 0){
		var _vsp = _vMove * base_spd * (1 + GetBuffByType(statuses, STAT.SPD));
		if (place_meeting(x , y + _vsp, oBarrier)){
			while(abs(_vsp) > 0.1){
				_vsp *= 0.5;
				if (!place_meeting(x , y + _vsp, oBarrier)) y += _vsp;
			}
			_vsp = 0;
		}
		y += _vsp;
	}
}

getCrit = function(){
	if (base_crit + GetBuffByType(statuses, STAT.CRIT) >= random(1)){
		return base_critdmg + GetBuffByType(statuses, STAT.CRITDMG);
	}
	return 0;
}

