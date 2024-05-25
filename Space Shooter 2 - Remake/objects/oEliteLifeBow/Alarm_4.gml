/// @description Attack-5 Sniper
var attack1 = CreateAttack(attackQueue, seconds(1.6), 2);
with (attack1){
	attack = function(){
		
		if (var1) {
			SummonEnemy(oEnemyLifeArrow, attacker.x, attacker.y, attacker.base_hp, 5000, attacker.base_dmg*10, 20, attacker.direction,attacker,attacker.element);
			var1 = false;
		}
		else {
			attacker.sprite_index = sEliteLifeBow_animation1;
			attacker.image_speed = 0.25;
			var1 = true;
			attacker.aim = seconds(1);
		}
		
	}
}

alarm[4] = RandomizeTime(seconds(5), seconds(2));