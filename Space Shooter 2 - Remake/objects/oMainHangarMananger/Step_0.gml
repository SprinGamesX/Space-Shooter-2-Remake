/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(global.key_right)){
	ship_index++;
	if (ship_index >= array_length(global.ships)) ship_index = 0;
}
if (keyboard_check_pressed(global.key_left)){
	ship_index--;
	if (ship_index < 0) ship_index = array_length(global.ships) - 1;
}
if (keyboard_check_pressed(ord("1"))){
	global.currentShip = ship_index;
	global.currentShipSlot = 1;
	room_goto(rInventory);
	InventorySort(oInventoryManager.inventory);
}
if (keyboard_check_pressed(ord("2"))){
	global.currentShip = ship_index;
	global.currentShipSlot = 2;
	room_goto(rInventory);
}
if (keyboard_check_pressed(ord("3"))){
	global.currentShip = ship_index;
	global.currentShipSlot = 3;
	room_goto(rInventory);
}
if (keyboard_check_pressed(ord("4"))){
	global.currentShip = ship_index;
	global.currentShipSlot = 4;
	room_goto(rInventory);
}if (keyboard_check_pressed(ord("5"))){
	global.currentShip = ship_index;
	global.currentShipSlot = 5;
	room_goto(rInventory);
}
if (keyboard_check_pressed(ord("6"))){
	global.currentShip = ship_index;
	global.currentShipSlot = 6;
	room_goto(rInventory);
}
if (keyboard_check_pressed(ord("7"))){
	global.currentShip = ship_index;
	global.currentShipSlot = 7;
	room_goto(rInventory);
}
if(keyboard_check_pressed(ord("8"))){
	global.currentShip = ship_index;
	global.currentShipSlot = 8;
	room_goto(rInventory);
}
if (keyboard_check_pressed(ord("9"))){
	global.currentShip = ship_index;
	global.currentShipSlot = 9;
	room_goto(rInventory);
}
if (keyboard_check_pressed(ord("0"))){
	global.currentShip = ship_index;
	global.currentShipSlot = 0;
	room_goto(rInventory);
}

if (keyboard_check_pressed(vk_escape)){
	room_goto(rMenu);
}

if (keyboard_check_pressed(global.key_up)){
	global.currentShip = ship_index;
	room_goto(rShipDetails);
}