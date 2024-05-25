/// @description Insert description here
// You can write your code in this editor
if (switch_cd > 0) switch_cd--;

if (switch_cd <= 0){
	if (keyboard_check_pressed(global.key_team1) and (instance_exists(team[getInactiveIndexes()[0]]))){
		switch_ship(getInactiveIndexes()[0]);
		switch_cd = switch_cd_max;
	}
	if (keyboard_check_pressed(global.key_team2) and (instance_exists(team[getInactiveIndexes()[1]]))){
		switch_ship(getInactiveIndexes()[1]);
		switch_cd = switch_cd_max;
	}
}

for (var i = 0; i < 3; i++){
	if (team_standing[i] == 1 and team[i].hp <= 0) {
		team_standing[i] = 0;
		forceSwitch();
	}
}