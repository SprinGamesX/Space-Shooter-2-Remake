/// @description Insert description here
// You can write your code in this editor
event_inherited();
base_hp = 500;
hp = base_hp;

element = ELEMENT.NONE;

attack_cd = seconds(1);
max_attack_cd = attack_cd;

var _attack1 = CreateAttack(attackQueue, seconds(0.2), 10,,-50, 10);
with(_attack1){
	attack = function(){
		SummonEnemy(oEnemyNormal, attacker.x, attacker.y, attacker.base_hp / 100, 0, 5, 7, 180 + var1,,GetRandomElement(false),,,,,true);
		var1 += var2;
	}
}

var _attack2 = CreateAttack(attackQueue, seconds(1), 20);
with(_attack2){
	attack = function(){
		for (var i = 0; i < room_height; i += 64)
		SummonEnemy(oEnemyNormal, room_width, i, attacker.base_hp / 25, 0, 5, 3, 180,,GetRandomElement(false));
		
	}
}

var _attack3 = CreateAttack(attackQueue, seconds(1), 20,,32, 32);
with(_attack3){
	attack = function(){
		SummonEnemy(oEnemyNormal, var1, 0, attacker.base_hp / 50, 0, 5, 3, 270);
		var1 += var2;
	}
}