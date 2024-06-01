/// @description
if (keyboard_check_pressed(global.key_left) and selection > 0){
	selection --;
}
if (keyboard_check_pressed(global.key_right) and selection < 2){
	selection ++;
}

if (keyboard_check_pressed(global.key_confirm)){
	var _m = map[global.domainIndex];
	
	if (global.endboss and global.domainIndex == array_length(map) - 1){
		global.nextDomain = _m;
	}
	else global.nextDomain = _m[selection]; 
	global.gamemode = GAMEMODE.DOMAINS;
	SaveDomainMap(map);
	room_goto(rBattle);
}