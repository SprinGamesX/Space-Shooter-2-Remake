/// @description Setup
options = [
	"CAMPAIGN","ENDLESS","PARTY", "HANGAR", "Construct", "EXIT"
]

menu_index = 0;
menu_index_max = array_length(options) - 1;
menu_space = 60;
x_pos = room_width / 2;
y_pos = room_height / 2;

global.gamemode = GAMEMODE.ENDLESS;

ini_open("data.ini");

for (var i = 0; i < 3; i++)
	global.party[i] = ini_read_real("party", i, i);

ini_close();