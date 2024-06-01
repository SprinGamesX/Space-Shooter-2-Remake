/// @description

if (dis_travelled == 0){
	if (instance_exists(parent.target))
		max_dis = point_distance(x, y, parent.target.x, parent.target.y) * 2;
	else max_dis = 0;
}


KillOutOfBounds(50);
image_angle = direction;
dis_travelled += speed;


var _col = instance_place(x,y, oParentEnemy);
if (_col != noone and ((parent.target == noone) or _col == parent.target)){
	if (last_hit_enemy != _col){
		last_hit_enemy = _col;
		_col.onHit(self);
		pierces--;
		if (!(object_is_ancestor(_col.object_index, oParentElite) and bouncer)){
			if (ds_exists(hitlist, ds_type_list))
				ds_list_add(hitlist, _col);
			target = noone;
			BounceOnEnemys();
		}
	}
}

if (dis_travelled >= max_dis) instance_destroy();

if (seeker){
	SeekClosestEnemy(,true);
}
else if (bouncer){
	BounceOnEnemys();
}
else if (crackshot){
	Crackshot(200);
}

part_type_orientation(echo, image_angle, image_angle, 0, 0, 0);
part_particles_create(global.particleSystem, x, y, echo, 1);