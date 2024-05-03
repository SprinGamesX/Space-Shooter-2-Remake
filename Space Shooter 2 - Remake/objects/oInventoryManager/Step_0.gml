/// @description Insert description here
// You can write your code in this editor
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
				_chip.ownerId = global.currentShip;
				_chip.ownerSlot = global.currentShipSlot;
				SaveChip(_chip.uuid);
				isSelected = false; inside_selected = -1;
			break;
			case 1: 
				isSelected = false; inside_selected = -1;
			break;
			case 2: 
				// Delete Chip
			break;
		}
	}
	
	if (keyboard_check_pressed(vk_escape)){
		room_goto(rHangar);
	}
	
	
}