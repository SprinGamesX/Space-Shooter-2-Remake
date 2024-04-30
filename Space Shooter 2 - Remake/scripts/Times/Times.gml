// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function seconds(_time){
	return _time * game_get_speed(gamespeed_fps);
}
function minutes(_time){
	return _time * 60 * game_get_speed(gamespeed_fps);
}

function RollChance(_odds){
	randomize();
	return (_odds >= random(1));
}