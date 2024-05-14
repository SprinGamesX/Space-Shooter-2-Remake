// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function InventorySort(_inventory){
	// Rarity
	// Type
	// Scale
	
	for(var i = 0; i < ds_list_size(_inventory); i++){
		var _swapped1 = false;
		for (var j = 0; j < ds_list_size(_inventory) - 1 - i; j++){
			
			var _i1 = _inventory[|j];
			var _i2 = _inventory[|j+1];
			if (CompareChip(_i1, _i2)){
				_inventory[|j] = _i2;
				_inventory[|j+1] = _i1;
				_swapped1 = true;
			}			
		}
		if (!_swapped1) break;
	}
	
}

function CompareChip(_c1, _c2){
	
	if (_c1.rarity < _c2.rarity) return true;
	if (_c1.rarity == _c2.rarity and _c1.stat > _c2.stat) return true;
	if (_c1.rarity == _c2.rarity and _c1.stat == _c2.stat and _c1.scale < _c2.scale) return true;
	
	return false;
}