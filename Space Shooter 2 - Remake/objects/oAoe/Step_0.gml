/// @description Insert description here
// You can write your code in this editor
if (active){
	var list = ds_list_create();
	var _count = instance_place_list(x, y, oParentEnemy, list, false);

	for (var i = 0; i < _count; i++){
		var _col = list[|i];
		if (_col != noone and ds_list_find_index(hitlist, _col) == -1){
			_col.onHit(self);
			ds_list_add(hitlist, _col);
		}
	}


	ds_list_destroy(list);
}