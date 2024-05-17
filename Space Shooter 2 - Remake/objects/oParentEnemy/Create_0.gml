/// @description Insert description here
// You can write your code in this editor

// main stats
is_boss = false;
base_hp = 0;
base_dmg = 0;
base_spd = 0;
base_res = 0;
base_def = 0;
leader = noone;
element = ELEMENT.NONE;
movement = MOVEMENT_PATTERN.LINE;

// entrance
image_xscale = 0;
image_yscale = 0;
entrance_done = false;

// dynamic stats
hp = base_hp;
explosive_immune = 0;

// movement
// (Line)
dir = 0;

// (Curve)
curve = 0;

// (Circle)
base_x = 0;
base_y = 0;
radius = 0;

// (Gravitate)
grav = 0;

trail = -1;

statuses = ds_list_create();

onHit = function(_projectile){
	var attacker = _projectile.parent;
	var base_dmg = 0;
	var _exploded = false;
	
	if (CheckForStatusByName(self, "Explosive")){
		CreateAoe(attacker, x, y, ATTACK_TYPE.EXPLOSIVE,ELEMENT.FIRE,3);
		_exploded = true;
		explosive_immune = seconds(1);
	}
	if (_exploded) RemoveStatusByName(self, "Explosive");
	if (CheckForStatusByName(self, "Sapped")){
		if (_projectile.atk_type != ATTACK_TYPE.SAPPED){
			AdditionallDamage(self, attacker, 0.01, ELEMENT.LIFE);
		}
	}
	if (CheckForStatusByName(self, "Shocked")){
		var _e = GetNearestInstances(x, y, oParentEnemy, 2);
		if (_projectile.atk_type != ATTACK_TYPE.SHOCKED){
			AdditionallDamage(self, attacker, 0.5, ELEMENT.LIGHTNING);
		}
	}
	
	// notify the ship and the projectile that it hit
	attacker.onHit(self);
	var _allies = oTeamManager.getInactiveShips();
	for (var i = 0; i < 2; i++){
		_allies[i].onAllyHit(self, attacker);
	}
	_projectile.onHit(self);
	
	// Gets base dmg
	switch(_projectile.atk_type){
		case ATTACK_TYPE.BASIC_ATTACK:
			base_dmg = attacker.onBasicHit(self);
		break;
		case ATTACK_TYPE.SKILL:
			base_dmg = attacker.onSkillHit(self);
		break;
		case ATTACK_TYPE.ULTIMATE:
			base_dmg = attacker.onUltHit(self);
		break;
		case ATTACK_TYPE.FOLLOWUP:
			base_dmg = attacker.onFollowupHit(self);
		break;
		case ATTACK_TYPE.EXPLOSIVE:
			base_dmg = attacker.onExplosive(self);
		break;
		case ATTACK_TYPE.SAPPED:
			base_dmg = attacker.onSapped(self);
		break;
		case ATTACK_TYPE.SHOCKED:
			base_dmg = attacker.onShocked(self);
		break;
	}
	// Enemy def calculation
	var def = GetDefense(attacker, self);
	
	// Attacker Crit
	var critdmg = attacker.getCrit();
	
	// Enemy - Attacker advantage
	var _dmg_dealt = GetFinalDamage(attacker, self, base_dmg, def, critdmg, _projectile.atk_type);
	
	
	hp -= _dmg_dealt;
	CreateDmgIndicator(string(_dmg_dealt), x, y, _projectile.element);
	
}

onDeath = function(){
	instance_destroy();
}

onEntrance = function(){
	if (image_xscale < 1){
		image_xscale += 0.02;
		image_yscale += 0.02;
	}
	else entrance_done = true;
}

alarm[0] = 2;