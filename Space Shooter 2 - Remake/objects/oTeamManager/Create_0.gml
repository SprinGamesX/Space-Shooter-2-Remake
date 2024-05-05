/// @description Insert description here
// You can write your code in this editor

global.particleSystem = part_system_create();
part_system_depth(global.particleSystem,layer_get_depth(layer_get_id("Parts")));

x = -100;
y = -100;

team_ids = [0,1,2];
team = [noone, noone, noone];
team[0] = instance_create_layer(room_width / 2, room_height / 2, "Player", global.ships[team_ids[0]]);
team[1] = instance_create_layer(room_width / 2, -100, "Player", global.ships[team_ids[1]]);
team[2] = instance_create_layer(room_width / 2, -100, "Player", global.ships[team_ids[2]]);

active_index = 0;

if (team[1] != noone)
	team[1].active = false;
if (team[2] != noone)
	team[2].active = false;
	
switch_cd = seconds(1);
switch_cd_max = switch_cd;

function switch_ship(_num){
	
	// Copy position
	team[_num].x = team[active_index].x;
	team[_num].y = team[active_index].y;
	
	// Reset inactive ship
	team[active_index].x = x;
	team[active_index].y = y;
	
	// Switch active
	team[active_index].active = false;
	active_index = _num;
	team[_num].active = true;
	
	switch_cd = switch_cd_max;
}

getActiveShip = function(){
	return team[active_index];
}

getInactiveShips = function(){
	var _team = [noone, noone];
	for (var i = 0; i < 3; i++){
		if (i != active_index) {
			if (_team[0] == noone) _team[0] = team[i];
			else _team[1] = team[i];
		}
	}
	return _team;
}

getAllShips = function(){
	return team;
}

// Gui
padding = 16;

