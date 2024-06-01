/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

target = noone;
target_timer = -1;
target_index = 0;

ultimate = 0;
ult_icd = 0;

onBasicAttack = function(){
	if (passives[2] and instance_exists(target)){
		var _dir = point_direction(x, y, target.x, target.y);
		CreateProjectile(oIceProj1, self, x, y, 15, _dir, ATTACK_TYPE.BASIC_ATTACK, element,,,0.5);
	}
	else {
		CreateProjectile(oIceProj1, self, x, y, 10, 0, ATTACK_TYPE.BASIC_ATTACK, element, 0.5);
	}
	ammo--;

}

onSkillAttack = function(){
	target = instance_nearest(x, y, oParentElite);
	
	if (passives[0]) ApplyDebuff(target, "Targeted", 10, false, false, STAT.ICERES, 0.25, seconds(20),,,,true);
	
	ApplyBuff(self, "Glacial Hunt", false, true, STAT.MAX_AMMO, 5, seconds(20));
	
	image_speed = 1;
	sprite_index = sIceShip2_opening;
	
	target_timer = seconds(20);
	target_index = 0;
}
onUltimateAttack = function(){
	energy = 0;
	
	ultimate = seconds(20);
	
	if (passives[1]) onSkillAttack();
	
}

onHit = function(_enemy){
	
	if (instance_exists(target) and _enemy.id == target.id){
		ApplyBuff(self, "Freezing Ambush", false, true, STAT.CRIT, 0.3, 1);
	}
	
	ApplyElementalDebuff(element, _enemy);
}

onBasicHit = function(){
	var _extra = 0;
	
	if (ultimate and target != noone){
		if (ult_icd == 0){
			var dis = max(target.sprite_width, target.sprite_height) * 2;
			var dir = random_range(0, 359);
			var xx = target.x + lengthdir_x(dis, dir);
			var yy = target.y + lengthdir_y(dis, dir);
		
			CreateProjectile(oIceSword1, self, xx, yy, 15, dir - 180, ATTACK_TYPE.FOLLOWUP, element,,,0.5);
			ult_icd = 2;
		} 
		else {
			ult_icd --;
		}
	}
	GenerateEnergy(self, 0.5);
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * (base_ba_scale + _extra);
}

onFollowupHit = function(_enemy){
	var _extra = 0;
	GenerateEnergy(self, 0.2); 
	
	
	
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * ((base_ult_scale) + _extra);
}

onBattleBegin = function(){
	sprite_index = sIceShip2_closed;
	image_speed = 0;
}