/// @description Insert description here
// You can write your code in this editor
KillOutOfBounds(50);
image_angle = direction;


var _col = instance_place(x,y, oParentEnemy);
if (_col != noone and ds_list_find_index(hitlist, _col) == -1){
	last_hit_enemy = _col;
	_col.onHit(self);
	pierces--;
	ds_list_add(hitlist, _col);
	if (pierces <= 0) instance_destroy();
	
}

if (seeker){
	SeekClosestEnemy();
}