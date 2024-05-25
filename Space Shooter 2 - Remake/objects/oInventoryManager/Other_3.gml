/// @description Insert description here
// You can write your code in this editor

	

SaveInventory();
SaveCurrencies();
SaveChips();
SaveShips();
SaveSTs();
if (global.clearAll){
	file_delete("chips.ini");
	file_delete("data.ini");
	file_delete("inventory.ini");
	file_delete("ST.ini");
}