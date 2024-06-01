/// @description
banner_title = "Glacial Pursuit";
banner_ship = oIceShip2;
banner_ships = [oIceShip3, oFireShip2, oLifeShip2];

pity = 0;

view = 0;

latest_roll = noone;
roll10 = array_create(10, noone);
cooldown = seconds(1);
show_num = 0;
alphas10 = array_create(10, 0);
alpha = 0;
animation = noone;
rar = 3;
doRoll10 = false;
currentBanner = 1;
banners = 2;
selected = 1;


savePity = function(){
	ini_open("data.ini");
	
	ini_write_real("Construct", "pity", pity);
	
	ini_close();
}

loadPity = function(){
	ini_open("data.ini");
	
	pity = ini_read_real("Construct", "pity", 0);
	
	ini_close();
}

roll = function(){
	randomize();
	if (RollChance(0.01) or pity == 69){
		latest_roll = banner_ship;
		show_debug_message("5 Star");
		pity = 0;
		if (!doRoll10) animation = instance_create_depth(0, 0, -300, oRollingAnimation5);
		rar = 5;
	}
	else if (RollChance(0.1)) {
		latest_roll = banner_ships[irandom(2)];
		show_debug_message("4 Star");
		pity++;
		if (!doRoll10) animation = instance_create_depth(0, 0, -300, oRollingAnimation4);
		if (rar < 4) rar = 4;
	}
	else {
		latest_roll = global.ships[irandom(6)];
		show_debug_message("3 Star");
		pity++;
		if (!doRoll10) animation = instance_create_depth(0, 0, -300, oRollingAnimation3);
	}
	view = 1;
	alpha = 0;
	GetShip(latest_roll);
}

tenRoll = function(){
	show_num = 0;
	rar = 3;
	doRoll10 = true;
	alphas10 = array_create(10, 0);
	for (var i = 0; i < 10; i++){
		roll();
		roll10[i] = latest_roll;
	}
	
	switch(rar){
		case 3: animation = instance_create_depth(0, 0, -300, oRollingAnimation3); break;
		case 4: animation = instance_create_depth(0, 0, -300, oRollingAnimation4); break;
		case 5: animation = instance_create_depth(0, 0, -300, oRollingAnimation5); break;
	}
	
	view = 2;
}

setBanner = function(_num){
	switch(_num){
		case 1:{
			banner_title = "Glacial Pursuit";
			banner_ship = oIceShip2;
			banner_ships = [oIceShip3, oFireShip2, oLifeShip2];
		}
		break;
		case 2:{
			banner_title = "Poisoning Soundwaves";
			banner_ship = oVenomShip2;
			banner_ships = [oIceShip3, oFireShip2, oLightningShip2];
		}
		break;
	}
}

loadPity();



