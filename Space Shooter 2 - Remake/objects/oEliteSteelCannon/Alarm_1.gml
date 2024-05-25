/// @description Attack-2 Reinforce Cannons



if (mini_cannons[0] == noone){
	var attack1 = CreateAttack(attackQueue, seconds(0.1), 1);
	with (attack1){
		attack = function(){
			attacker.mini_cannons[0] = SummonEnemy(oEnemySteelMiniCannon, attacker.x - 108, attacker.y + 64, attacker.base_hp / 2, 500, attacker.base_dmg * 100, 0, 180, attacker);
		}
	}
}
else {
	var attack1 = CreateAttack(attackQueue, seconds(0.1), 1);
	with (attack1){
		attack = function(){
			SummonEnemyLiner(oEnemyNormal, attacker.x - 148, attacker.y + 64, attacker.base_hp / 100, 0, attacker.base_dmg * 2, 0, 180, attacker,attacker.element,,sSteelCannonMiniShield, false);
		}
	}
}
if (mini_cannons[1] == noone){
	var attack1 = CreateAttack(attackQueue, seconds(0.2), 1);
	with (attack1){
		attack = function(){
			attacker.mini_cannons[1] = SummonEnemy(oEnemySteelMiniCannon, attacker.x - 108, attacker.y - 64, attacker.base_hp / 2, 500, attacker.base_dmg * 100, 0, 180, attacker);
		}
	}
}
else {
	var attack1 = CreateAttack(attackQueue, seconds(0.2), 1);
	with (attack1){
		attack = function(){
			SummonEnemyLiner(oEnemyNormal, attacker.x - 148, attacker.y - 64, attacker.base_hp / 100, 0, attacker.base_dmg * 2, 0, 180, attacker,attacker.element,,sSteelCannonMiniShield, false);
		}
	}
}

alarm[1] = RandomizeTime(seconds(5), seconds(3));