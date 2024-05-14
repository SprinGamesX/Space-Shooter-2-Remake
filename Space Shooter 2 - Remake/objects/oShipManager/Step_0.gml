/// @description

if (!treeMode){
	if (keyboard_check_pressed(global.key_right) and selector < 4){
		selector++;
	}
	if (keyboard_check_pressed(global.key_left)and selector > 0){
		selector--;
	}
	if (selector == 4 and keyboard_check_pressed(global.key_confirm)){
		treeMode = true;
	}
}
else {
	var _ship = global.ships[global.currentShip];
	var _s = instance_create_layer(-100, -100, "Instances", _ship);
	var skill_tree = GetTreeForElement(_s.element);
	var _index = skill_tree[cursor[1]][cursor[0]];
	var _cost = GetCostForSTNode(_index);
	var _unlockable = global.shipST[global.currentShip][FindDependency(_s.element,_index)] and global.scraps > _cost;
	
	
	instance_destroy(_s);
	if (keyboard_check_pressed(global.key_right) and cursor[0] < 6){
		cursor[0]++;
	}
	if (keyboard_check_pressed(global.key_left)and cursor[0] > 0){
		cursor[0]--;
	}
	if (keyboard_check_pressed(global.key_down) and cursor[1] < 6){
		cursor[1]++;
	}
	if (keyboard_check_pressed(global.key_up)and cursor[1] > 0){
		cursor[1]--;
	}
	if (keyboard_check_pressed(global.key_confirm) and (!global.shipST[global.currentShip][_index]) and _unlockable){
		global.shipST[global.currentShip][_index] = 1;
		global.scraps -= _cost;
	}
	
}