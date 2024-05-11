/// @description Attack-4 Ice ring
var attack1 = CreateAttack(attackQueue, seconds(0.4), 7);
with (attack1){
	attack = function(){
		var _inst = SummonEnemy(oEnemyNormal, attacker.x, attacker.y, attacker.base_hp * 0.15, 100, attacker.base_dmg, 2, 0,attacker, attacker.element, MOVEMENT_PATTERN.CIRCLE,,128,,true);
	}
}

alarm[3] = seconds(25);