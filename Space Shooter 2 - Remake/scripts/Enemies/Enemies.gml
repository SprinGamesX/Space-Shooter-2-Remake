// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function SummonEnemy(_oEnemy,_x, _y, _hp, _def, _dmg, _spd, _dir, _summoner = noone, _element = ELEMENT.NONE, _move_pattern = MOVEMENT_PATTERN.LINE, _curve = 0, _radius = 0, _grav = 0, _isSmall = false){
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
		
		if (_element != ELEMENT.NONE){
			trail = GetTrailByElement(_element)
		}
		
		sprite_index = sEnemyNormal;
		if (_isSmall) sprite_index = sEnemySmall;
		image_index = _element;
		
	}
	
}

function CreateAttack(_queue, _cd, _repeat = 1, _attacker = self, _var1 = 0, _var2 = 0, _var3 = 0, _var4 = 0){
	var _inst = instance_create_layer(100, -100, "Misc", cEnemyAttack);
	with (_inst){
		repeatAttack = _repeat;
		cd = _cd;
		max_cd = _cd;
		attacker = _attacker;
		active = false;
		var1 = _var1;
		var2 = _var2;
		var3 = _var3;
		var4 = _var4;
	}
	ds_queue_enqueue(_queue, _inst);
	return _inst;
}

function GetRandomElement(_includeQuantum = true){
	var _list = [ELEMENT.NONE, ELEMENT.ICE, ELEMENT.FIRE, ELEMENT.LIFE, ELEMENT.VENOM, ELEMENT.LIGHTNING, ELEMENT.STEEL, ELEMENT.QUANTUM]
	return _list[random(6 + _includeQuantum)];
}

function GetNearestInstances(pointx, pointy, object, n)
{
    n = min(max(1,n),instance_number(object));
    var list = ds_priority_create();
    var nearest = noone;
    with (object) ds_priority_add(list,id,distance_to_point(pointx,pointy));
    repeat (n) nearest = ds_priority_delete_min(list);
    ds_priority_destroy(list);
    return nearest;
}