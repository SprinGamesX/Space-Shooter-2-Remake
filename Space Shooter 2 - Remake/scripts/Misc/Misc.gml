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

function InRange(_x, _min, _max){
	return _x > _min and _x < _max;
}

function RandomizeTime(_base, _factor){
	if (instance_exists(self) and (object_is_ancestor(object_index, oParentEnemy)) and (ds_exists(statuses, ds_type_list))){
		return ((_base) + random_range(-_factor, _factor)) * (1 - GetBuffByType(self, STAT.COOLDOWN));
	}
	return (_base) + random_range(-_factor, _factor);
}