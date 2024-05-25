/// @description attack-1 Aimed Shot
var attack1 = CreateAttack(attackQueue, seconds(0.4), 8,,false);
with (attack1){
	attack = function(){
		
		if (var1) {
			SummonEnemy(oEnemyLifeArrow, attacker.x, attacker.y, attacker.base_hp/10, 100, attacker.base_dmg, 10, attacker.direction - 10,attacker,attacker.element);
			SummonEnemy(oEnemyLifeArrow, attacker.x, attacker.y, attacker.base_hp/10, 100, attacker.base_dmg, 10, attacker.direction,attacker,attacker.element);
			SummonEnemy(oEnemyLifeArrow, attacker.x, attacker.y, attacker.base_hp/10, 100, attacker.base_dmg, 10, attacker.direction + 10,attacker,attacker.element);
			var1 = false;
		}
		else {
			attacker.sprite_index = sEliteLifeBow_animation1;
			var1 = true;
		}
		
	}
}


alarm[0] = RandomizeTime(seconds(3), seconds(1));