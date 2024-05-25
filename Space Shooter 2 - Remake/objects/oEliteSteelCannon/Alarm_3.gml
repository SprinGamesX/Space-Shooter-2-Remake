/// @description Attack-4 Activate Cannons
var attack1 = CreateAttack(attackQueue, seconds(0.2), 10);
with (attack1){
	attack = function(){
		var _i = irandom(1);
		show_debug_message(_i);
		if (instance_exists(attacker.mini_cannons[_i])){
			attacker.mini_cannons[_i].skill();
			show_debug_message("FIRE");
		}
		else show_debug_message("FAIL");
	}
}

alarm[3] = RandomizeTime(seconds(10), seconds(3));