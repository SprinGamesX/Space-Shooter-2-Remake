/// @description
ini_open("data.ini");

for (var i = 0; i < 3; i++)
	ini_write_real("party", i, global.party[i]);

ini_close();