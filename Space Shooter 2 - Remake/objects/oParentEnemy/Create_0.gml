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


statuses = ds_list_create();

onHit = function(_projectile){
	var attacker = _projectile.parent;
	var base_dmg = 0;
	
	// notify the ship and the projectile that it hit
	attacker.onHit(self);
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
	}
	// Enemy def calculation
	var def = (5000 - (base_def + (base_def * (1 + GetBuffByType(attacker, ENEMY_STAT.DEF) - GetBuffByType(attacker, STAT.DEF_PEN)))))/5000
	
	// Attacker Crit
	var critdmg = attacker.getCrit();
	
	// Enemy - Attacker advantage
	var _dmg_dealt = (base_dmg) * (1 + GetBuffByType(attacker, STAT.DMG) + GetElementalBuff(attacker, attacker.element)) * (1 + critdmg) * (1 - (base_res + GetBuffByType(self, ENEMY_STAT.RES))) * (1 + IsElementStrong(_projectile.element, element)) * (def);
	
	
	hp -= _dmg_dealt;
	//show_debug_message(base_dmg);
	//show_debug_message(1 + GetBuffByType(attacker, STAT.DMG))
	//show_debug_message(1 + critdmg)
	//show_debug_message(1 - (base_res + GetBuffByType(statuses, ENEMY_STAT.RES)))
	//show_debug_message(1 - IsElementStrong(_projectile.element, element))
	//show_debug_message(def)
	show_debug_message(string(_dmg_dealt));
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