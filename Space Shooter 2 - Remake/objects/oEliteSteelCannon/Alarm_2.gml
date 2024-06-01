/// @description Attack-3 Shockwave

if (shield_exists) {
	var attack1 = CreateAttack(attackQueue, seconds(0.5), 10);
	with (attack1){
		attack = function(){
			for (var i = -10; i <= 10; i += 10){
				if (attacker.shield_exists)
					SummonEnemy(oEnemySteelShield, attacker.x - 128, attacker.y, attacker.base_hp / 2, 500, attacker.base_dmg * 2, 5, 180 + i, attacker);
			}
		}
	}
}
alarm[2] = RandomizeTime(seconds(20), seconds(5));