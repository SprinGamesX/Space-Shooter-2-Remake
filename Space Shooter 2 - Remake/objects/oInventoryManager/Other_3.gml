/// @description Insert description here
// You can write your code in this editor
ini_open("inventory.ini");
	
for (var i = 0; i < ds_list_size(inventory); i++){
	inventory[|i] = inventory[|i].compress();
}
var savedList = ds_list_write(inventory);
ini_write_string("Saves", "inv", savedList);

ini_close();

SaveChips();