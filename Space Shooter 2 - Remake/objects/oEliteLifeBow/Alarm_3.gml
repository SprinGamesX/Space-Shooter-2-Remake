/// @description Attack-3 Charged
var attack1 = CreateAttack(attackQueue, seconds(0.1), 3);
with (attack1){
	attack = function(){
		var _inst = SummonEnemy(oEnemyNormal, random_range(800, room_width), random_range(100, room_height - 100), attacker.base_hp * 0.05, 100, attacker.base_dmg, 0, 0,attacker, attacker.element);
		attacker.consume_time = seconds(10);
	}
}

alarm[3] = RandomizeTime(seconds(40), seconds(7));