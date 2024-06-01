/// @description

if (keyboard_check_pressed(global.key_left) and selection > 0){
	selection--;
}

if (keyboard_check_pressed(global.key_up) and selection > 9){
	selection -= 10;
}

if (keyboard_check_pressed(global.key_right) and selection < array_length(global.ships) - 1){
	selection++;
}
if (keyboard_check_pressed(global.key_down) and selection < array_length(global.ships) - 10){
	selection += 10;
}

var _selectable = selection != global.party[global.party_index-1] and global.shipInventory[selection] == 1;
if (keyboard_check_pressed(global.key_confirm) and _selectable){
	if (selection == global.party[0]){
		global.party[0] = global.party[global.party_index-1];
		global.party[global.party_index-1] = selection;
	}
	else if (selection == global.party[1]){
		global.party[1] = global.party[global.party_index-1];
		global.party[global.party_index-1] = selection;
	
	}
	else if (selection == global.party[2]){
		global.party[2] = global.party[global.party_index-1];
		global.party[global.party_index-1] = selection;
	
	}
	else {
		global.party[global.party_index-1] = selection;
	}
	oRoomManager.goBack();
}