/// @description attack-1 Iceball barrage
var attack1 = CreateAttack(attackQueue, seconds(0.2), 5,,72);
with (attack1){
	attack = function(){
		var _dir = random(360);
		var _x = attacker.x + lengthdir_x(var1, _dir);
		var _y = attacker.y + lengthdir_y(var1, _dir);
		
		var _target = oTeamManager.getActiveShip();
		
		var _inst = SummonEnemy(oEnemyNormal, _x, _y, attacker.base_hp / 10, 100, attacker.base_dmg*3, 7, point_direction(_x, _y, _target.x, _target.y),attacker, attacker.element,,,,,true);
	}
}


alarm[0] = RandomizeTime(seconds(7), seconds(2));