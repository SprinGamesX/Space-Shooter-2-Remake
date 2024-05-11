/// @description


if (keyboard_check_pressed(global.key_left) and global.party_index > 1){
	global.party_index--;
}
if (keyboard_check_pressed(global.key_right) and global.party_index < 3){
	global.party_index++;
}

if (keyboard_check_pressed(global.key_confirm)){
	room_goto(rShipInventory);
}