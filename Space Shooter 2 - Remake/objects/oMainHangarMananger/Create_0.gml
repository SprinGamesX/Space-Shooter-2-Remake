/// @description Insert description here
// You can write your code in this editor
ship_index = global.currentShip;
global.currentShipSlot = 0;


var count = 0;
for (var i = 0; i < array_length(global.shipInventory); i++){
	if (global.shipInventory[i] == 1) count++;
}

shiplist = array_create(count);
shipIndexs = array_create(count);
var _index = 0;
for (var i = 0; i < array_length(global.shipInventory); i++){
	if (global.shipInventory[i] == 1) {
		shiplist[_index] = global.ships[i];
		shipIndexs[_index] = i;
		if (i == global.currentShip) ship_index = _index;
		_index++;
	}
}

updateCost = function(){
	var lvl = global.shipLv[ship_index];
	cost = 10 * power(lvl+1, 2);
}
updateCost();