/// @description


if (keyboard_check_pressed(global.key_down)){
	room_goto(rHangar);
}

if (keyboard_check_pressed(global.key_right) and selector < 4){
	selector++;
}
if (keyboard_check_pressed(global.key_left)and selector > 0){
	selector--;
}