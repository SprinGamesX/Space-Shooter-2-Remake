/// @description Attack-2 Tracking arrows
var attack1 = CreateAttack(attackQueue, seconds(0.4), 8,,false);
with (attack1){
	attack = function(){
		
		if (var1) {
			SummonEnemy(oEnemyLifeArrow, attacker.x, attacker.y, attacker.base_hp/10, 100, attacker.base_dmg, 10, attacker.direction + 40,attacker,attacker.element,MOVEMENT_PATTERN.CURVE,-0.7);
			SummonEnemy(oEnemyLifeArrow, attacker.x, attacker.y, attacker.base_hp/10, 100, attacker.base_dmg, 10, attacker.direction - 40,attacker,attacker.element,MOVEMENT_PATTERN.CURVE,0.7);
			var1 = false;
		}
		else {
			attacker.sprite_index = sEliteLifeBow_animation1;
			var1 = true;
		}
		
	}
}

alarm[1] = RandomizeTime(seconds(10), seconds(2));