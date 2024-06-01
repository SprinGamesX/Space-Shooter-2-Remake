/// @description
KillOutOfBounds(50);
image_angle = direction;



var _col = instance_place(x,y, oParentEnemy);
if (_col != noone and ((parent.target == noone) or _col == parent.target)){
	last_hit_enemy = _col;
	_col.onHit(self);
	pierces--;
	if (!(object_is_ancestor(_col.object_index, oParentElite) and bouncer)){
		if (ds_exists(hitlist, ds_type_list))
			ds_list_add(hitlist, _col);
		target = noone;
		BounceOnEnemys();
	}
	if (pierces <= 0) instance_destroy();
	
}

if (seeker){
	SeekClosestEnemy(,true);
}
else if (bouncer){
	BounceOnEnemys();
}
else if (crackshot){
	Crackshot(200);
}
