/// @description

// Inherit the parent event
event_inherited();


rot = 0; 
recoil1 = 0;
recoil2 = 0;
cannon = true;

onEntrance = function(){
	if (image_xscale < 1){
		image_xscale += 0.1;
		image_yscale += 0.1;
	}
	else entrance_done = true;
}

skill = function(){
	SummonEnemy(oEnemyNormal, x, y, leader.base_hp / 20, 100, leader.base_dmg, 5, rot, leader, leader.element,MOVEMENT_PATTERN.LINE,,,,true);
	if (cannon) recoil1 = 3;
	else recoil2 = 3;
	cannon = !cannon;
}

onDeath = function(){
	ApplyDebuff(leader, "Wrecked Cannon", 10, true, false, STAT.DMG_RECIVED, 0.1, seconds(60), 10,,oTeamManager.getActiveShip(),true);
	ApplyDebuff(leader, "Wrecked Cannon2", 10, true, false, STAT.COOLDOWN, 1, seconds(1), 10,1,oTeamManager.getActiveShip(),true);
	
	var _ships = oTeamManager.getAllShips();
	for (var i = 0; i < 3; i++){
		_ships[i].onKill();
	}
	
	instance_destroy();
}