/// @description Attack-3 Cookout
var attack1 = CreateAttack(attackQueue, seconds(0.1), 25);
with (attack1){
	attack = function(){
		var _inst = SummonEnemy(oEnemyNormal, room_width, room_height, attacker.base_hp / 20, 100, attacker.base_dmg, 3, 180 + random_range(-10, 10),attacker, attacker.element, MOVEMENT_PATTERN.CURVE, -0.2);
		var _inst = SummonEnemy(oEnemyNormal, room_width, 0, attacker.base_hp / 20, 100, attacker.base_dmg, 3, 180 + random_range(-10, 10),attacker, attacker.element, MOVEMENT_PATTERN.CURVE,0.2);
	}
}

alarm[2] = seconds(20);