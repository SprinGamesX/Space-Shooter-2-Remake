/// @description

if (!treeMode){
	if (keyboard_check_pressed(global.key_down)){
		room_goto(rHangar);
	}

	if (keyboard_check_pressed(global.key_right) and selector < 4){
		selector++;
	}
	if (keyboard_check_pressed(global.key_left)and selector > 0){
		selector--;
	}
	if (selector == 4 and keyboard_check_pressed(global.key_confirm)){
		treeMode = true;
	}
}
else {

	if (keyboard_check_pressed(global.key_right) and cursor[0] < 6){
		cursor[0]++;
	}
	if (keyboard_check_pressed(global.key_left)and cursor[0] > 0){
		cursor[0]--;
	}
	if (keyboard_check_pressed(global.key_down) and cursor[1] < 6){
		cursor[1]++;
	}
	if (keyboard_check_pressed(global.key_up)and cursor[1] > 0){
		cursor[1]--;
	}

}