/// @description Insert description here
// You can write your code in this editor
if (active){
	
	if (!instance_exists(attacker)){
		instance_destroy();
	}
	else {
		if (cd > 0) cd--;
		else {
			attack();
			cd = max_cd;
			repeatAttack--;
		}

		if (repeatAttack == 0) {
			if (instance_exists(attacker)){
				attacker.onAttackFinish();
				
			}
			instance_destroy();
		}
	}
}