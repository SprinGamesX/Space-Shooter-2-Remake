/// @description Attack-5 ATTACK
var attack1 = CreateAttack(attackQueue, seconds(1), 4);
with (attack1){
	attack = function(){
		for (var i = -45; i <= 45; i += 7.5){
			SummonEnemyLiner(oEnemyNormal, attacker.x, attacker.y, attacker.base_hp / 5, 100, attacker.base_dmg, 7, attacker.rot + i, attacker, attacker.element,,sSteelCannonBall, false);
		}
		attacker.recoil = 10;
	}
}

alarm[4] = RandomizeTime(seconds(8), seconds(2));