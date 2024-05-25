/// @description Attack-3 Decoy
var attack1 = CreateAttack(attackQueue, seconds(0.1), 1);
with (attack1){
	attack = function(){
		var _target = oTeamManager.getActiveShip();
		var _inst = SummonEnemy(oEnemyIceShardsDecoy, attacker.x, attacker.y, attacker.base_hp, 100, attacker.base_dmg, 1, point_direction(attacker.x, attacker.y, _target.x, _target.y),attacker, attacker.element,MOVEMENT_PATTERN.GRAVITATE,,,0.1);
		with(_inst){
			sprite_index = sEliteIceShards;
		}
	}
}
invis = true;

alarm[2] = RandomizeTime(seconds(60), seconds(10));