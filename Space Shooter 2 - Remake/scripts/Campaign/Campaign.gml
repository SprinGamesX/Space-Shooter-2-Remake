// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

global.nextDomain = DOMAIN.COMBAT;
global.domainIndex = -1;

function GenerateDomainMap(_length, _choices = 3, _endBoss = true){
	
	global.domainIndex = 0;
	global.endboss = _endBoss;
	
	var arr = array_create(_length);
	if (_endBoss){
		for (var i = 0; i < _length-1; i++){
			
			var arr2 = array_create(_choices);
			
			for (var j = 0; j < _choices; j++){
				arr2[j] = choose(DOMAIN.COMBAT, DOMAIN.CHALLANGE, DOMAIN.MYSTERY, DOMAIN.HEAL);
			}
			
			arr[i] = arr2;
		}
		arr[_length-1] = DOMAIN.BOSS;
	}
	else {
		for (var i = 0; i < _length; i++){
			
			var arr2 = array_create(_choices);
			
			for (var j = 0; j < _choices; j++){
				arr2[j] = choose(DOMAIN.COMBAT, DOMAIN.CHALLANGE, DOMAIN.MYSTERY, DOMAIN.HEAL);
			}
			arr[i] = arr2;
		}
	}
	return arr;
}

function SaveDomainMap(_map){
	ini_open("Domains.ini");
	
	ini_write_real("data", "length", array_length(_map));
	ini_write_real("data", "choices", array_length(_map[0]));

	ini_write_real("data", "index", global.domainIndex);
	
	ini_write_real("data", "endboss", global.endboss);
	if (global.endboss){
		for (var i = 0; i < array_length(_map) - 1; i++){
			for (var j = 0; j < array_length(_map[0]); j++){
				ini_write_real(i, j, _map[i][j]);
			}
		}
		ini_write_real("boss", "end", true);
	}
	else {
		for (var i = 0; i < array_length(_map); i++){
			for (var j = 0; j < array_length(_map[0]); j++){
				ini_write_real(i, j, _map[i][j]);
			}
		}
		ini_write_real("boss", "end", false);
	}
	ini_close();
}

function LoadDomainMap(){
	ini_open("Domains.ini");
	
	if (ini_read_real("data", "length", -1)) == -1 return -1;
	
	var _len = ini_read_real("data", "length", -1);
	var _choice = ini_read_real("data", "choices", -1);
	
	if (global.domainIndex == -1){
		global.domainIndex = ini_read_real("data", "index", 0);
	}
	
	global.endboss = ini_read_real("boss", "end", false);
	
	var _map = array_create(_len);
	
	for (var i = 0; i < _len; i++){
		if (global.endboss and i != _len-1) _map[i] = array_create(_choice);
	}
	
	var _choices = 3;
	
	for (var i = 0; i < _len; i++){
		for (var j = 0; j < _choice; j++){
			if (global.endboss and i != _len-1) _map[i][j] = ini_read_real(i, j, 0);
		}
	}
	if (global.endboss) _map[_len-1] = DOMAIN.BOSS;
	ini_close();
	return _map;
}

function GetDomainTitle(_type){
	switch(_type){
		case DOMAIN.COMBAT: return "Combat Domain";
		case DOMAIN.CHALLANGE: return "Challange Domain";
		case DOMAIN.MYSTERY: return "Mystery Domain";
		case DOMAIN.HEAL: return "Restore";
		case DOMAIN.BOSS: return "Boss Domain";
	}
}