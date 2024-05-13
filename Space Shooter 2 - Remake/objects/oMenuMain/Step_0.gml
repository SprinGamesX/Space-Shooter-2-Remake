if (keyboard_check_pressed(global.key_up)){
	if (menu_index > 0){
		menu_index--;
	}
	else{
		menu_index = menu_index_max;
	}
}
if (keyboard_check_pressed(global.key_down)){
	if (menu_index < menu_index_max){
		menu_index++;
	}
	else{
		menu_index = 0;
	}
}
if (keyboard_check_pressed(global.key_confirm)){
	switch(menu_index){
		case 0: 
			global.gamemode = GAMEMODE.DOMAINS;
			room_goto(rLevelSelection);
		break;
		case 1: 
			global.gamemode = GAMEMODE.ENDLESS;
			room_goto(rBattle);
		break;
		case 2: 
			room_goto(rParty);
		break;
		case 3: 
			room_goto(rHangar);
		break;
		case 4: 
			game_end();
		break;
		
	}
}