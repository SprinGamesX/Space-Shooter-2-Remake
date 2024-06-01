/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();



onBasicAttack = function(){
	CreateProjectile(oVenomSoundwave, self, x, y + 22, 10, 0, ATTACK_TYPE.BASIC_ATTACK, element);
	CreateProjectile(oVenomSoundwave, self, x, y - 22, 10, 0, ATTACK_TYPE.BASIC_ATTACK, element);
	ammo--;
}

// Skill attack
onSkillAttack = function(){
	
	CreateFollower(oVenomBuffer, self, 0, 48, seconds(0.1), seconds(1));
	CreateFollower(oVenomBuffer, self, 0, -48, seconds(0.1), seconds(1));
}



// Ultimate attack
onUltimateAttack = function(){
	energy = 0;
	var _list = GetAllEnemies();
	for (var i = 0; i < ds_list_size(_list); i++){
			ApplyPoison(_list[|i], "Strong Vibration", 3, seconds(2), 5, self);
	}
	ds_list_destroy(_list);
	
	if (passives[2]){
		var _list = GetAllElites();
		for (var i = 0; i < ds_list_size(_list); i++){
			TriggerDots(_list[|i]);
		}
		ds_list_destroy(_list);
	}
	
	var part = part_type_create();
	part_type_speed(part, 10, 20, 0, 0);
	part_type_alpha2(part, 1, 0);
	part_type_life(part, seconds(5), seconds(5));
	part_type_sprite(part, sPixel, 0, 0, 0);
	part_type_color1(part, ColorForElement(element));
	part_type_size(part, 1, 3, 0, 0);
	part_type_direction(part, 0, 360, 0, 0);
	
	part_particles_create(global.particleSystem, x, y, part, 200);
	
}

onSkillHit = function(_enemy){
	var _extra = 0;
	ApplyPoison(_enemy, "Vibration", 0.5, seconds(0.2),,self);
	if (passives[0]) ApplyDebuff(self, "Sound Fragility", 1.5,false, false, STAT.DEF, 0.2, seconds(10));
	return (base_atk * (1 + GetBuffByType(self, STAT.ATK))) * (base_skill_scale + _extra);
}

onPoison = function(_enemy){
	ApplyBuff(self, "Sound Logic", true, true, STAT.ATK, 0.01, 1, 100);
	if(passives[1]) ApplyDebuff(self, "Buzzing", 0.75,false, false, STAT.VENOMRES, 0.02, seconds(3), 5);
}

onBattleBegin = function(){
	sprite_index = sVenomShip2_animated;
	image_speed = 1;
	
}