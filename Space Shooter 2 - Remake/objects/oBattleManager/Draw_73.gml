/// @description

if (ds_list_size(elites) == 1){
	var _enemy = elites[|0];
	if (instance_exists(_enemy)){
		var barWidth = 94 * 2;
		var _color = ColorForElement(_enemy.element);

		draw_sprite_ext(sEnemyHpBar, 1, room_width/2, 32, 2, 2, 0, _color, 1)

		draw_sprite_ext(sEnemyHpCover, 0, room_width/2 + barWidth, 32,2*(1 - _enemy.hp/_enemy.base_hp), 2,0 ,_color, 1)

		draw_sprite_ext(sEnemyHpBar, 0, room_width/2, 32, 2, 2, 0, _color, 1);
	}
}

if (ds_list_size(elites) == 2){
	for (var i = 0; i < 2; i++){
		var _enemy = elites[|i];
		
		if (instance_exists(_enemy)){
			var _x = room_width/4 * (2 * i + 1) ;

			var barWidth = 94 * 2;
			var _color = ColorForElement(_enemy.element);

			draw_sprite_ext(sEnemyHpBar, 1, _x, 32, 2, 2, 0, _color, 1)

			draw_sprite_ext(sEnemyHpCover, 0, _x + barWidth, 32,2*(1 - _enemy.hp/_enemy.base_hp), 2,0 ,_color, 1)

			draw_sprite_ext(sEnemyHpBar, 0, _x, 32, 2, 2, 0, _color, 1);
		}
	}
}