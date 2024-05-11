/// @description Attack-5 Lava
var attack1 = CreateAttack(attackQueue, seconds(0.1), 4);
with (attack1){
	attack = function(){
		
		var _x = irandom(1);
		
		if (_x == 1)
			var _inst = SummonEnemy(oEnemyNormal, random_range(0, room_width), 0, attacker.base_hp * 0.5, 100, attacker.base_dmg, 10, 270,attacker, attacker.element,MOVEMENT_PATTERN.GRAVITATE,,,-0.3);
		else
			var _inst = SummonEnemy(oEnemyNormal, random_range(0, room_width), room_height, attacker.base_hp * 0.5, 100, attacker.base_dmg, 10, 90,attacker, attacker.element,MOVEMENT_PATTERN.GRAVITATE,,,-0.3);
	}
}

alarm[4] = seconds(3);