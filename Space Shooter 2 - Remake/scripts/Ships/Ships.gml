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



global.shipLv = array_create(array_length(global.ships));
global.chips = array_create(array_length(global.ships));

global.currentShip = 0;

global.party = [0,2,4];


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
				base_skill_scale = 0.01;

				// ultimate
				max_energy = 100;
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
				max_energy = 120;
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
				base_ba_scale = 0.05;

				// skill
				base_skill_cd = seconds(15);
				base_skill_scale = 0;

				// ultimate
				max_energy = 140;
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
				max_energy = 160;
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
				base_skill_cd = seconds(30);
				base_skill_scale = 0;

				// ultimate
				max_energy = 250;
				base_ult_scale = 0.15;
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
				base_ammo = 5;
				base_ba_cd = seconds(0.5);
				base_ba_scale = 0.1;

				// skill
				base_skill_cd = seconds(30);
				base_skill_scale = 0.3;

				// ultimate
				max_energy = 180;
				base_ult_scale = 0;
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
				base_ba_scale = 0.2;

				// skill
				base_skill_cd = seconds(15);
				base_skill_scale = 0.5;

				// ultimate
				max_energy = 300;
				base_ult_scale = 0.25;
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
	_target.hp = min(_target.hp + _hp, base_hp);
	_target.onHpRestoration(_hp);
	
	var _xy = oTeamManager.getShipGuiXY(_target);
	CreateIndicator("+" + string(_hp) + " Healing", _xy[0], _xy[1], ELEMENT.LIFE);
}
function RestoreTeamHp(_hp){
	var _team = oTeamManager.getAllShips();
	for (var i = 0; i < array_length(_team); i++){
		RestoreHp(_team[i], _hp);
	}
}

function ApplyShield(_target, _shield){
	_target.shield += _shield;
	
	var _xy = oTeamManager.getShipGuiXY(_target);
	CreateIndicator("+" + string(_shield) + " Shield", _xy[0], _xy[1], ELEMENT.STEEL);
}
function ApplyTeamShield(_shield){
	var _team = oTeamManager.getAllShips();
	for (var i = 0; i < array_length(_team); i++){
		ApplyShield(_team[i], _shield);
	}
}

function GenerateEnergy(_target, _energy){
	_target.energy += _energy * (1 + GetBuffByType(_target,STAT.ENERGYBOOST));
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

function SaveShips(){
	ini_open("data.ini");
	for (var i = 0; i < array_length(global.shipLv); i++){
		ini_write_real("levels", i, global.shipLv[i]);
	}
	ini_close();
}
function LoadShips(){
	ini_open("data.ini");
	for (var i = 0; i < array_length(global.shipLv); i++){
		global.shipLv[i] = ini_read_real("levels", i, 1);
	}
	ini_close();
}