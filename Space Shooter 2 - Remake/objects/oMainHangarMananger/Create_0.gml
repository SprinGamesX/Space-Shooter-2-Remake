/// @description Insert description here
// You can write your code in this editor
ship_index = global.currentShip;
global.currentShipSlot = 0;




updateCost = function(){
	var lvl = global.shipLv[ship_index];
	cost = 10 * power(lvl+1, 2);
}
updateCost();