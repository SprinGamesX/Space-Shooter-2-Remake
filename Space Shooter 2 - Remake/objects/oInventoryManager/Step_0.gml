
// Drawing inventory
if (room == rInventory){
	if (!isSelected){
		if (keyboard_check_pressed(global.key_right)) selected++;

		if (keyboard_check_pressed(global.key_left)) selected--;
		if (keyboard_check_pressed(global.key_up) and selected > 9) selected -= 10;
		if (keyboard_check_pressed(global.key_down)) selected += 10;
	}
	else {
		if (keyboard_check_pressed(global.key_up) and inside_selected > 0)  inside_selected--;
		if (keyboard_check_pressed(global.key_down) and inside_selected < 2) inside_selected++;
		
		if (keyboard_check_pressed(global.key_right)) global.currentShipSlot++;
		if (keyboard_check_pressed(global.key_left)) global.currentShipSlot--;
		
		if (global.currentShipSlot > 9) global.currentShipSlot = 0;
		else if (global.currentShipSlot < 0) global.currentShipSlot = 9;
	}

	if (selected >= 90 + (10 * offset)) {
		offset++;
	}
	if (selected < (offset*10)){
		if (offset >= 1)
			offset--;
	}

	if (keyboard_check_pressed(vk_enter)){
		ds_list_add(inventory, GenerateRandomChip());
	}
	if (keyboard_check_pressed(global.key_confirm) and (!isSelected) and (instance_exists(inventory[|selected]))){
		isSelected = true;
		inside_selected = 0;
	}
	else if (keyboard_check_pressed(global.key_confirm) and (isSelected)){
		switch(inside_selected){
			case 0: 
				var _chip = inventory[|selected];
				UnequipCurrentChip(global.chips[global.currentShip][global.currentShipSlot]);
				if (_chip.ownerId != -1){
					global.chips[_chip.ownerId, _chip.ownerSlot] = -1;
				}
				if (!(inventory[|selected].uuid == global.chips[global.currentShip][global.currentShipSlot])){
					_chip.ownerId = global.currentShip;
					_chip.ownerSlot = global.currentShipSlot;
					SaveChip(_chip.uuid);
				}
				else global.chips[global.currentShip][global.currentShipSlot] = -1;
				
				isSelected = false; inside_selected = -1;
			break;
			case 1: 
				isSelected = false; inside_selected = -1;
			break;
			case 2: 
				// Delete Chip
				var _chip = inventory[|selected];
				UnequipCurrentChip(global.chips[global.currentShip][global.currentShipSlot]);
				if (_chip.ownerId != -1){
					global.chips[_chip.ownerId, _chip.ownerSlot] = -1;
				}
				if (!(inventory[|selected].uuid == global.chips[global.currentShip][global.currentShipSlot])){
					_chip.ownerId = global.currentShip;
					_chip.ownerSlot = global.currentShipSlot;
				}
				else global.chips[global.currentShip][global.currentShipSlot] = -1;
				
				ds_list_delete(inventory, selected);
				
				global.scraps += power(10, _chip.rarity) + irandom(10);
				instance_destroy(_chip);
				isSelected = false; inside_selected = -1;
				
			break;
		}
	}
	
	if (keyboard_check_pressed(vk_escape)){
		room_goto(rHangar);
	}
	if (keyboard_check_pressed(vk_shift)){
		InventorySort(inventory);
	}
}
if (keyboard_check_pressed(vk_delete) and keyboard_check_pressed(vk_shift)){
	global.clearAll = true;
	game_end();
}
