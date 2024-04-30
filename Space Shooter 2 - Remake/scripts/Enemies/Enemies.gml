// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SummonEnemy(_oEnemy,_x, _y, _hp, _def, _dmg, _spd, _dir, _summoner = noone, _element = ELEMENT.NONE, _move_pattern = MOVEMENT_PATTERN.LINE, _curve = 0, _radius = 0, _grav = 0){
	var _inst = instance_create_layer(_x, _y, "Enemies", _oEnemy);
	with(_inst){
		base_hp = _hp;
		base_dmg = _dmg;
		base_spd = _spd;
		base_res = 0;
		base_def = _def;
		leader = _summoner;
		element = _element;
		movement = _move_pattern;
		
		hp = base_hp;
		
		base_x = _x;
		base_y = _y;
		
		curve = _curve;
		radius = _radius;
		grav = _grav;
		dir = _dir;
		
	}
	
}