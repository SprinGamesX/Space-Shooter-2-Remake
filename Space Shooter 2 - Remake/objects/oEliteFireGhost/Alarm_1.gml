/// @description Attack-2 Fire Stream
var attack1 = CreateAttack(attackQueue, seconds(0.1), 15);
with (attack1){
	attack = function(){
		var _inst = SummonEnemy(oEnemyNormal, attacker.x, attacker.y, attacker.base_hp / 20, 100, attacker.base_dmg, 3, 180 + random_range(-10, 10),attacker, attacker.element,,,,,true);
	}
}

alarm[1] = RandomizeTime(seconds(15), seconds(3));