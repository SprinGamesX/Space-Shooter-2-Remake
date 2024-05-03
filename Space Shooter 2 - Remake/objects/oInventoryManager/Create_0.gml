/// @description Insert description here
// You can write your code in this editor
#macro INVENTORYSIZE 900
inventory = ds_list_create();
selected = 0;
offset = 0;
inside_selected = -1;
isSelected = false;

ini_open("inventory.ini");
	
var _saved = ini_read_string("Saves", "inv", "");
ds_list_read(inventory, _saved);
for (var i = 0; i < ds_list_size(inventory); i++){
	inventory[|i] = DecompressChip(inventory[|i]);
}
ini_close();

LoadChips();

show_debug_message("Created");



getChip = function(_uuid){
	for (var i = 0; i < ds_list_size(inventory); i++){
		if (inventory[|i].uuid == _uuid) return inventory[|i];
	}
}