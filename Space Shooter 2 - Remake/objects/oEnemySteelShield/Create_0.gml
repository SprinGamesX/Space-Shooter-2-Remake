/// @description

// Inherit the parent event
event_inherited();

onEntrance = function(){
	if (image_xscale < 1){
		image_xscale += 0.1;
		image_yscale += 0.1;
	}
	else entrance_done = true;
}

onDeath = function(){
	ApplyDebuff(leader, "Wrecked Shield", 10, true, false, STAT.SPD, 0.25, 1, 2,,oTeamManager.getActiveShip(),true);
	leader.shield_exists = false;
	
	var _ships = oTeamManager.getAllShips();
	for (var i = 0; i < 3; i++){
		_ships[i].onKill();
	}
	
	instance_destroy();
}