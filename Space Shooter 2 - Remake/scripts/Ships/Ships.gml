// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.ships = 
[
	oIceShip1,
	oFireShip1,
	oLifeShip1,
	oVenomShip1,
	oLightningShip1,
	oSteelShip1,
	oQuantumShip1
]


global.chips = array_create(array_length(global.ships));

global.currentShip = 0;



function InitiateShip(_id){
	var _ship = GetShipDetails(_id);
	
	// base stats
	base_atk = _ship.base_atk;
	base_hp = _ship.base_hp;
	base_spd = _ship.base_spd;
	base_aspd = _ship.base_aspd;

	// basic attack
	base_reload_cd = _ship.base_reload_cd;
	base_ammo = _ship.base_ammo;
	base_ba_cd = _ship.base_ba_cd;
	base_ba_scale = _ship.base_ba_scale;

	// skill
	base_skill_cd = _ship.base_skill_cd;
	base_skill_scale = _ship.base_skill_scale;

	// ultimate
	max_energy = _ship.max_energy;
	base_ult_scale = _ship.base_ult_scale;
	
	instance_destroy(_ship);
	
}



function GetShipDetails(_id){
	var _inst = noone;
	switch(_id){
		// IceShip1
		case 0:{
			_inst = instance_create_depth(-100,-100,999, cShip);
			with(_inst){
				
				name = "Ice1";
				lvl = 1;

				// base stats
				base_atk = 30;
				base_hp = 100;
				base_spd = 4;
				base_aspd = 1;

				// basic attack
				base_reload_cd = seconds(1);
				base_ammo = 30;
				base_ba_cd = seconds(0.25);
				base_ba_scale = 0.1;

				// skill
				base_skill_cd = seconds(5);
				base_skill_scale = 0.4;

				// ultimate
				max_energy = 50;
				base_ult_scale = 0.75;
			}
		} break;
		// FireShip1
		case 1:{
			_inst = instance_create_depth(-100,-100,999, cShip);
			with(_inst){
				
				name = "Fire1";
				lvl = 1;

				// base stats
				base_atk = 30;
				base_hp = 100;
				base_spd = 4;
				base_aspd = 1;

				// basic attack
				base_reload_cd = seconds(4);
				base_ammo = 200;
				base_ba_cd = seconds(0.25);
				base_ba_scale = 0.1;

				// skill
				base_skill_cd = seconds(15);
				base_skill_scale = 0.4;

				// ultimate
				max_energy = 50;
				base_ult_scale = 0.2;
			}
		} break;
		
		// LifeShip1
		case 2:{
			_inst = instance_create_depth(-100,-100,999, cShip);
			with(_inst){
				
				name = "Life1";
				lvl = 1;

				// base stats
				base_atk = 30;
				base_hp = 100;
				base_spd = 4;
				base_aspd = 1;

				// basic attack
				base_reload_cd = seconds(0.5);
				base_ammo = 10;
				base_ba_cd = seconds(0.25);
				base_ba_scale = 0.1;

				// skill
				base_skill_cd = seconds(15);
				base_skill_scale = 0.4;

				// ultimate
				max_energy = 50;
				base_ult_scale = 0.75;
			}
		} break;
		case 3:{
			_inst = instance_create_depth(-100,-100,999, cShip);
			with(_inst){
				
				name = "Venom1";
				lvl = 1;

				// base stats
				base_atk = 30;
				base_hp = 100;
				base_spd = 4;
				base_aspd = 1;

				// basic attack
				base_reload_cd = seconds(1);
				base_ammo = 10;
				base_ba_cd = seconds(0.25);
				base_ba_scale = 0.1;

				// skill
				base_skill_cd = seconds(15);
				base_skill_scale = 0.4;

				// ultimate
				max_energy = 50;
				base_ult_scale = 0.75;
			}
		} break;
		case 4:{
			_inst = instance_create_depth(-100,-100,999, cShip);
			with(_inst){
				
				name = "Lightning1";
				lvl = 1;

				// base stats
				base_atk = 30;
				base_hp = 100;
				base_spd = 4;
				base_aspd = 1;

				// basic attack
				base_reload_cd = seconds(1);
				base_ammo = 10;
				base_ba_cd = seconds(0.25);
				base_ba_scale = 0.1;

				// skill
				base_skill_cd = seconds(15);
				base_skill_scale = 0.4;

				// ultimate
				max_energy = 50;
				base_ult_scale = 0.75;
			}
		} break;
		case 5:{
			_inst = instance_create_depth(-100,-100,999, cShip);
			with(_inst){
				
				name = "Steel1";
				lvl = 1;

				// base stats
				base_atk = 30;
				base_hp = 100;
				base_spd = 4;
				base_aspd = 1;

				// basic attack
				base_reload_cd = seconds(1);
				base_ammo = 10;
				base_ba_cd = seconds(0.25);
				base_ba_scale = 0.1;

				// skill
				base_skill_cd = seconds(15);
				base_skill_scale = 0.4;

				// ultimate
				max_energy = 50;
				base_ult_scale = 0.75;
			}
		} break;
		case 6:{
			_inst = instance_create_depth(-100,-100,999, cShip);
			with(_inst){
				
				name = "Quantum1";
				lvl = 1;

				// base stats
				base_atk = 30;
				base_hp = 100;
				base_spd = 4;
				base_aspd = 1;

				// basic attack
				base_reload_cd = seconds(1);
				base_ammo = 10;
				base_ba_cd = seconds(0.25);
				base_ba_scale = 0.1;

				// skill
				base_skill_cd = seconds(15);
				base_skill_scale = 0.4;

				// ultimate
				max_energy = 50;
				base_ult_scale = 0.75;
			}
		} break;
		
		
	}
	return _inst;
}

function ConsumeHp(_target ,_hp){
	_target.hp = max(hp - _hp, 1);
	_target.onHpReduction(_hp);
		
	
}

function RestoreHp(_target, _hp){
	_target.hp = min(hp + _hp, base_hp);
	_target.onHpRestoration(_hp);
	CreateIndicator("+" + string(_hp), _target.x, _target.y, ELEMENT.LIFE);
}


function SaveChips(){
	ini_open("chips.ini")
	for (var i = 0; i < array_length(global.chips); i++){
		for (var j = 0; j < 10; j++){
			ini_write_real(i, j, global.chips[i][j]);
		}
	}
	ini_close();
}

function LoadChips(){
	ini_open("chips.ini")
	for (var i = 0; i < array_length(global.chips); i++){
		global.chips[i] = array_create(10);
		for (var j = 0; j < 10; j++){
			global.chips[i][j] = ini_read_real(i, j, -1);
		}
	}
	ini_close();
}