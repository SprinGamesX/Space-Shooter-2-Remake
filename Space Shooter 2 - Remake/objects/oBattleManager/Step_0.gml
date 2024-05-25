/// @description
if (gamemode == GAMEMODE.ENDLESS){
	if (!instance_exists(oParentElite)){
		
		if (endless_began){
			global.rewards[0] += (500 * lv) + irandom(100 * lv);
			global.rewards[1] += (5 * lv) + irandom(1 * lv);
			GenerateInventoryChips((lv div 10) + 1);
			lv += irandom_range(2, 5);
		}
		ds_list_clear(elites);
		var _count = irandom_range(1, 2);
		for (var i = 0; i < _count; i++){
			var _elite = choose(oEliteFireGhost, oEliteIceShards, oEliteLifeBow);
			var _y = _count == 1 ? room_height/2 : room_height/3 * (i + 1);
			var _inst = SummonElite(_elite, room_width - 96, _y, lv);
			_inst.setup();
			ds_list_add(elites,_inst);
		}
		endless_began = true;
	}
	
}
if (gamemode == GAMEMODE.TRAINING){
	if (!instance_exists(oParentElite)){
		SummonElite(oEliteSteelCannon, room_width - 96, room_height/2, lv);
	}
}
if (oTeamManager.isTeamDead()){
	room_goto(rRewards);
}