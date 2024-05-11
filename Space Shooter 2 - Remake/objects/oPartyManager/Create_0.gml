/// @description
global.party_index = 1;

if (oRoomManager.getLastRoom() != rShipInventory){
	ini_open("data.ini");

	for (var i = 0; i < 3; i++)
		global.party[i] = ini_read_real("party", i, i);

	ini_close();
}