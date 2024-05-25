/// @description Attack-3 Charged
var attack1 = CreateAttack(attackQueue, seconds(0.2), 10);
with (attack1){
	attack = function(){
		var _inst = SummonEnemy(oEnemyNormal, attacker.x, attacker.y, attacker.base_hp * 0.15, 100, attacker.base_dmg, 2, 0,attacker, attacker.element, MOVEMENT_PATTERN.CIRCLE,,72,,true);
	}
}

alarm[3] = RandomizeTime(seconds(30), seconds(14));