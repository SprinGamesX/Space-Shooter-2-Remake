/// @description Attack-5 Spikes
var attack1 = CreateAttack(attackQueue, seconds(0.1), 4);
with (attack1){
	attack = function(){
		var _inst = SummonEnemy(oEnemyNormal, random_range(0, room_width), 0, attacker.base_hp * 0.5, 100, attacker.base_dmg, 0, 270,attacker, attacker.element,MOVEMENT_PATTERN.GRAVITATE,,,0.2,true);
	}
}

alarm[4] = RandomizeTime(seconds(5), seconds(1));