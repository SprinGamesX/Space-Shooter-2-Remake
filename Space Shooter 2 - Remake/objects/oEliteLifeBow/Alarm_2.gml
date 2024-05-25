/// @description Attack-3 Frenzy
var attack1 = CreateAttack(attackQueue, seconds(0.2), 20,,false);
with (attack1){
	attack = function(){
		
		if (var1) {
			SummonEnemy(oEnemyLifeArrow, attacker.x, attacker.y, attacker.base_hp/10, 100, attacker.base_dmg, 10, attacker.direction + random_range(-10, 10),attacker,attacker.element);
			var1 = false;
		}
		else {
			attacker.sprite_index = sEliteLifeBow_animation1;
			attacker.image_speed = 2;
			var1 = true;
		}
		
	}
}

alarm[2] = RandomizeTime(seconds(15), seconds(5));