/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


onBasicAttack = function(){
	CreateProjectile(oIceShard1, self, x, y, 10, 0, ATTACK_TYPE.BASIC_ATTACK, element);
	ammo--;

}

onSkillAttack = function(){
	GenerateEnergy(self, 5);
	
	CreateFollower(oIce3Follower, self, 64, -32, seconds(0.5), seconds(20));
	
}
onUltimateAttack = function(){
	CreateProjectile(oIceShard1, self, x, y, 15, 0, ATTACK_TYPE.ULTIMATE, element,10, true);
	energy = 0;
}

onHit = function(_enemy){
	ApplyElementalDebuff(element, _enemy);
	ApplyDebuff(_enemy, "Slowing Frost", 1, false, false, STAT.SPD, 0.1, seconds(15));
}

onAllyHit = function(_enemy, _ally){
	if (hp > 0)
		GenerateEnergy(self, 0.1);
	if (passives[1]){
		ApplyDebuff(_enemy, "Slowing Frost", 1, false, false, STAT.SPD, 0.1, seconds(15));
	}
}


onBasicHit = function(){
	var _extra = 0;
	GenerateEnergy(self, 1);
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * (base_ba_scale + _extra);
}

onSkillHit = function(_enemy){
	var _extra = 0;
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * (base_skill_scale + _extra);
}

onUltHit = function(_enemy){
	var _extra = 0;
	ApplyDebuff(_enemy, "Slowing Frost", 1, false, false, STAT.SPD, 0.9, seconds(15));
	
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * (base_ult_scale + _extra);
}

onFollowupHit = function(_enemy){
	var _extra = 0;
	ApplyDebuff(_enemy, "Slowing Frost", 1, false, false, STAT.SPD, 0.5, seconds(10));
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * (base_ba_scale + _extra);
}
