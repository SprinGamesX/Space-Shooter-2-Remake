/// @description Insert description here

base_atk = 0;
base_hp = 0;
base_spd = 3;
base_aspd = 0;
base_ammo = 0;

ammo = 0;

active = true;


statuses = [];


// this function is called once the ship gets a kill
onKill = function(){
	
}

// this function is called once the ship hits an enemy
onEnemyHit = function(){
	
}

// this function is called once the ship is hit
onHit = function(){
	
}

// Basic attack
onBasicAttack = function(){

}

// Skill attack
onSkillAttack = function(){

}

// Ultimate attack
onUltimateAttack = function(){

}

// Movement
movement = function(){
	var _hMove = keyboard_check(global.key_right) - keyboard_check(global.key_left);
	var _vMove = keyboard_check(global.key_down) - keyboard_check(global.key_up);
	
	if (_hMove != 0){
		var _hsp = _hMove * base_spd * GetBuffByType(statuses, STAT.SPD)
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
		var _vsp = _vMove * base_spd * GetBuffByType(statuses, STAT.SPD)
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

