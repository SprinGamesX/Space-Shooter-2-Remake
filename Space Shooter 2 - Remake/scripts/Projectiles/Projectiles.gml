// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function CreateProjectile(_obj ,_parent, _x, _y, _spd, _dir, _scale, _dmgtype){
	var _inst = instance_create_layer(_x, _y, "Projectiles", _obj);
	with(_inst){
		parent = _parent;
		spd = _spd;
		scale = _scale;
		dir = _dir;
	}
	_inst.onCreation();
	return _inst;
}

function KillOutOfBounds(_offset){
	if (x > room_width + _offset or x < -_offset or y < -_offset or y > room_height + _offset){
		instance_destroy();
	}
}