/// @description
if (view == 0){
	var _s = instance_create_depth(-100, -100, 999, banner_ship);

	draw_sprite_ext(sBannerBG, 0, room_width/2, room_height/2, 4, 4, 0, Color2ForElement(_s.element), 1);
	draw_sprite_ext(_s.sprite_index, 0, room_width/2 - 160, room_height/2, 3, 3, 0, c_white, 1);

	for (var i = 0; i < 3; i++){
		var _s2 = instance_create_depth(-100, -100, 999, banner_ships[i]);
	
		draw_sprite_ext(_s2.sprite_index, 0, room_width/2 + (i * 106) + 32, room_height/2 + 96, 2, 2, 90, c_white, 1);
	
		instance_destroy(_s2);
	}
	
	
	
	if (selected == 1) draw_setup(font_menu_details, ColorForElement(_s.element)); else draw_setup(font_menu_details);
	draw_text_scribble(room_width/2, room_height - 160, "Roll x1 - 120 [sEmerald]");
	
	if (selected == 2) draw_setup(font_menu_details, ColorForElement(_s.element)); else draw_setup(font_menu_details);
	draw_text_scribble(room_width/2, room_height - 128, "Roll x10 - 1200 [sEmerald]");
	
	draw_setup(font_menu_details);
	draw_text_scribble(room_width/2, room_height - 64, string(pity) + "/70");
	
	draw_setup(font_banners, ColorForElement(_s.element));
	draw_text_scribble(room_width/2, 128, banner_title);
	
	draw_sprite_ext(sGUIArrow, 0, room_width - 96, room_height/2, 2, 2, 0, c_white, 1);
	draw_sprite_ext(sGUIArrow, 0, 96, room_height/2, 2, 2, 180, c_white, 1);

	instance_destroy(_s);
}
if (view == 1){
	if (!instance_exists(animation)){
		var _s = instance_create_depth(-100, -100, 999, latest_roll);
		draw_sprite_ext(_s.sprite_index, 0, room_width/2, room_height/2, 3, 3, 0, c_white, alpha);
		if (alpha < 1) alpha += 0.1;
		instance_destroy(_s);
	}
}
if (view == 2){
	if (!instance_exists(animation)){
		var _spacex = 156;
		var xx = room_width/2 - _spacex*2;
		var yy = room_height/2 - 64;
		for (var i = 0; i < 10 and i <= show_num; i++){
			var _s = instance_create_depth(-100, -100, 999, roll10[i]);
			draw_sprite_ext(_s.sprite_index, 0, xx + (_spacex * (i % 5)), i < 5 ? yy : yy + 128, 2, 2, 0, c_white, alphas10[i]);
			instance_destroy(_s);
			if (alphas10[i] < 1) alphas10[i] += 0.1;
		}
		if (cooldown == 0) and (show_num < 10) {
			show_num++;
			cooldown = seconds(0.1);
		}
	}
}