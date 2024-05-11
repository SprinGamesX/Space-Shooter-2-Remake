/// @description Insert description here

// base stats (do not change)
base_atk = 0;
base_hp = 0;
base_spd = 3;
base_aspd = 1;
base_energy_regen = 1;
base_ammo = 0;
max_energy = 50;
base_skill_cd = 0;
base_ba_cd = 0;
base_reload_cd = 0;
base_crit = 0.05;
base_critdmg = 0.5;

InitiateShip(shipId);

// dynamic stats (do change)
energy = 0;
ammo = 0;
active = true;
skill_cd = 0;
ba_cd = 0;
reload_cd = 0;
hp = base_hp;
shield = 0;

// list of buffs and nerfs
statuses = ds_list_create();
chips = array_create(10);
for (var i = 0; i < 10; i++){
	chips[i] = oInventoryManager.getChip(global.chips[shipId][i]);
}


// called once the ship gets a kill
onKill = function(){
	GenerateEnergy(self, 5);
}

onHpReduction = function(_amount){
	
}

onHpRestoration = function(_amount){
	
}

// called once the ship is Hit
onEnemyHit = function(_enemy){
	var _res = 0;
	if (element == ELEMENT.STEEL) and (RollChance(0.25)){
		_res = 0.5;
		CreateDmgIndicator("Blocked", x, y, ELEMENT.STEEL);
	}
	GenerateEnergy(self, 2);
	
	if (shield > 0){
		shield -= (_enemy.base_dmg * (1 + GetBuffByType(_enemy, STAT.DMG))) * (1 - GetBuffByType(self, STAT.RES) - _res);
		if (shield < 0) {
			hp += shield;
			onHpReduction(-shield);
		}
	}
	else {
		var _dmg = (_enemy.base_dmg * (1 + GetBuffByType(_enemy, STAT.DMG))) * (1 - GetBuffByType(self, STAT.RES) - _res);
		hp -= _dmg;
		onHpReduction(_dmg);
		
	}
	if (!_enemy.is_boss) instance_destroy(_enemy);
}

// called once the ship hits an enemy
onHit = function(_enemy){
	GenerateEnergy(self, 0.5);
	ApplyElementalDebuff(element, _enemy);
}

onAllyHit = function(_enemy, _ally){
	GenerateEnergy(self, 0.1);
}

// Basic attack
onBasicAttack = function(){
	
}

// Skill attack
onSkillAttack = function(){
	GenerateEnergy(self, 10);
}

// Ultimate attack
onUltimateAttack = function(){
	energy = 0;
}

// called when atk/skill/ult hits; calculates base dmg
onBasicHit = function(_enemy){
	var _extra = 0;
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * (base_ba_scale + _extra);
}
onSkillHit = function(_enemy){
	var _extra = 0;
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * (base_skill_scale + _extra);
}
onUltHit = function(_enemy){
	var _extra = 0;
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * (base_ult_scale + _extra);
}
onFollowupHit = function(_enemy){
	var _extra = 0;
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * (base_skill_scale + _extra);
}



onCrit = function(){

}

// Movement
movement = function(){
	var _hMove = keyboard_check(global.key_right) - keyboard_check(global.key_left);
	var _vMove = keyboard_check(global.key_down) - keyboard_check(global.key_up);
	
	if (_hMove != 0){
		var _hsp = _hMove * base_spd * (1 + GetBuffByType(self, STAT.SPD));
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
		var _vsp = _vMove * base_spd * (1 + GetBuffByType(self, STAT.SPD));
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
	if (base_crit + GetBuffByType(self, STAT.CRIT) >= random(1)){
		onCrit();
		return base_critdmg + GetBuffByType(self, STAT.CRITDMG);
	}
	return 0;
}

getAtk = function(){
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK)));
}

getMaxHp = function(){
	return (base_hp * (1 + GetBuffByType(self, STAT.HP)));
}

onBattleBegin = function(){
	
}


