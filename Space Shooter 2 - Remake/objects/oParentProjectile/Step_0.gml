/// @description Insert description here
// You can write your code in this editor
KillOutOfBounds(50);
image_angle = direction;



var _col = instance_place(x,y, oParentEnemy);
if (_col != noone and (!ds_exists(hitlist, ds_type_list) or ds_list_find_index(hitlist, _col) == -1)){
	last_hit_enemy = _col;
	if (instance_exists(self)) _col.onHit(self);
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



if (part_type_exists(trail)){
	SpawnParticleByElement(element, trail);
}