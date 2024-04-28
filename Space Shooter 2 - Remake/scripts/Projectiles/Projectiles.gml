// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function CreateProjectile(_obj ,_parent, _x, _y, _spd, _dir, _atk_type, _element, _pierces = 1, _is_seeker = false){
	var _inst = instance_create_layer(_x, _y, "Projectiles", _obj);
	with(_inst){
		parent = _parent;
		spd = _spd;
		atk_type = _atk_type;
		dir = _dir;
		element = _element;
		pierces = _pierces;
		seeker = _is_seeker;
	}
	_inst.onCreation();
	return _inst;
}

function KillOutOfBounds(_offset){
	if (x > room_width + _offset or x < -_offset or y < -_offset or y > room_height + _offset){
		instance_destroy();
	}
}

function SeekClosestEnemy(_correction = 30, _exclude_normals = false){
	if (instance_exists(oParentEnemy)){
		var _enemy = instance_nearest(x,y, oParentEnemy);
		var _dir = point_direction(x,y, _enemy.x, _enemy.y);
		var _d = direction;
		if (_d > 180) _d -= 360;
		var _r = _dir;
		if (_r > 180) _r -= 360;
		var _error = abs((_r - _d) / 180);
		if ((_r - _d) > 0) direction += _correction * _error;
		if ((_r - _d) < 0) direction -= _correction * _error;
	}
	else seek_closest_enemy();
}