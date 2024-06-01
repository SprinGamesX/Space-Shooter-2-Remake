/// @description Insert description here
// You can write your code in this editor
event_inherited();
base_hp = 500;
hp = base_hp;
base_def = 100;

element = ELEMENT.NONE;
spin = true;

setup();

attack_cd = seconds(1);
max_attack_cd = attack_cd;

onDeath = function(){
	hp = base_hp;
	
	var _ships = oTeamManager.getAllShips();
	for (var i = 0; i < 3; i++){
		_ships[i].onKill();
	}
}