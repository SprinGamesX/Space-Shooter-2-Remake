/// @description
if (gamemode == GAMEMODE.ENDLESS){
	if (!instance_exists(oParentElite)){
		ds_list_clear(elites);
		var _count = irandom_range(1, 2);
		for (var i = 0; i < _count; i++){
			var _elite = choose(oEliteFireGhost, oEliteIceShards);
			var _y = _count == 1 ? room_height/2 : room_height/4 * (2 * i + 1);
			ds_list_add(elites,instance_create_layer(room_width - 96, _y, "Enemies", _elite));
		}
	}
	
}