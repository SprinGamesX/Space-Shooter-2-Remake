/// @description Attack-2 Freezing streams
var attack1 = CreateAttack(attackQueue, seconds(0.1), 5);
with (attack1){
	attack = function(){
		SummonEnemy(oEnemyNormal, attacker.x, attacker.y, attacker.base_hp / 20, 100, attacker.base_dmg, 3, 180,attacker, attacker.element,,,,,true);
		SummonEnemy(oEnemyNormal, attacker.x, attacker.y, attacker.base_hp / 20, 100, attacker.base_dmg, 3, 190,attacker, attacker.element,,,,,true);
		SummonEnemy(oEnemyNormal, attacker.x, attacker.y, attacker.base_hp / 20, 100, attacker.base_dmg, 3, 170,attacker, attacker.element,,,,,true);
	}
}

alarm[1] = RandomizeTime(seconds(10), seconds(3));