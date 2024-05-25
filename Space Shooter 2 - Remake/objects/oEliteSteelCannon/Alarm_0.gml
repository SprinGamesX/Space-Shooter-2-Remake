/// @description attack-1 Summon Shield

if (!shield_exists){
	var attack1 = CreateAttack(attackQueue, seconds(0), 1);
	with (attack1){
		attack = function(){
			SummonEnemy(oEnemySteelShield, attacker.x - 128, attacker.y, attacker.base_hp / 2, 500, attacker.base_dmg * 100, 0, 180, attacker);
		}
	}
	shield_exists = true;
}


alarm[0] = RandomizeTime(seconds(100), seconds(1));