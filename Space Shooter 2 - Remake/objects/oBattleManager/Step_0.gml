/// @description
if (gamemode == GAMEMODE.ENDLESS){
	if (!instance_exists(oParentElite)){
		ds_list_clear(elites);
		lv += irandom_range(2, 5);
		var _count = irandom_range(1, 2);
		for (var i = 0; i < _count; i++){
			var _elite = choose(oEliteFireGhost, oEliteIceShards, oEliteLifeBow);
			var _y = _count == 1 ? room_height/2 : room_height/4 * (2 * i + 1);
			var _inst = SummonElite(_elite, room_width - 96, _y, lv);
			_inst.setup();
			ds_list_add(elites,_inst);
		}
	}
	
}
if (gamemode == GAMEMODE.TRAINING){
	if (!instance_exists(oParentElite)){
		instance_create_layer(room_width - 96, room_height/2, "Enemies", oEliteExperimental);
	}
}
if (oTeamManager.isTeamDead()){
	oRoomManager.goBack();
}