// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function CreateProjectile(_obj ,_parent, _x, _y, _spd, _dir, _atk_type, _element, _pierces = 1, _is_seeker = false, _aoe = 1, _is_bouncer = false, _is_crackshot = false){
	var _inst = instance_create_layer(_x, _y, "Projectiles", _obj);
	with(_inst){
		parent = _parent;
		spd = _spd;
		atk_type = _atk_type;
		dir = _dir;
		element = _element;
		pierces = _pierces;
		seeker = _is_seeker;
		aoe = _aoe;
		bouncer = _is_bouncer;
		target = noone;
		crackshot = _is_crackshot;
		distance = 0;
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
	var _enemy = _exclude_normals ?  instance_nearest(x,y, oParentElite) : instance_nearest(x,y, oParentEnemy);
	if (instance_exists(_enemy)){
		var _dir = point_direction(x,y, _enemy.x, _enemy.y);
		var _d = direction;
		if (_d > 180) _d -= 360;
		var _r = _dir;
		if (_r > 180) _r -= 360;
		var _error = abs((_r - _d) / 180);
		if ((_r - _d) > 0) direction += _correction * _error;
		if ((_r - _d) < 0) direction -= _correction * _error;
	}
}

function BounceOnEnemys(){
	if (ds_exists(hitlist, ds_type_list) and !ds_list_empty(hitlist)){
		if (target == noone){
			var _enemy = noone;
				for (var i = 0; i < pierces; i++){
					_enemy = GetNearestInstances(x, y, oParentEnemy, i+1);
					if (ds_list_find_index(hitlist, _enemy) == -1) target = _enemy; break;
				}
			}
		else if (instance_exists(target)){
			direction = point_direction(x, y, target.x, target.y);
		}
	}
}

function Crackshot(_distance){
	distance += speed;
	if (distance > _distance){
		var _e = instance_nearest(x, y, oParentElite);
		if (instance_exists(_e)){
			direction = point_direction(x, y, _e.x, _e.y);
		}
	}
	
}

function AoeSpriteByElement(_element){
	switch(_element){
		case ELEMENT.ICE: return sAoeIce;
		case ELEMENT.FIRE: return sAoeFire;
		case ELEMENT.LIFE: return sAoeLife;
		case ELEMENT.VENOM: return sAoeVenom;
		case ELEMENT.LIGHTNING: return sAoeLightning;
		case ELEMENT.QUANTUM: return sAoeQuantum;
		case ELEMENT.STEEL: return sAoeSteel;
	}
}

function CreateAoe(_parent, _x, _y, _atk_type, _element, _size, _ignored_enemy = noone){
	var _inst = instance_create_layer(_x, _y, "Aoe", oAoe);
	with(_inst){
		sprite_index = AoeSpriteByElement(_element);
		parent = _parent;
		atk_type = _atk_type;
		size = _size;
		image_xscale = size;
		image_yscale = size;
		element = _element;
		if (_ignored_enemy != noone) ds_list_add(hitlist, _ignored_enemy);
		active = true;
	}
	return _inst;
}
