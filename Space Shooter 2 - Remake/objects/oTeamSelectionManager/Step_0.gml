/// @description
#macro MAXDIFF 5

if (keyboard_check_pressed(global.key_down) and editor < 3) editor++;
if (keyboard_check_pressed(global.key_up) and editor > 1) editor--;

switch(editor){
	case 1:{
		if (keyboard_check_pressed(global.key_left) and levelIndex > 0) levelIndex--;
		else if (keyboard_check_pressed(global.key_right) and levelIndex < array_length(levellist) - 1) levelIndex++;
	} break;
	
	case 2:{
		if (keyboard_check_pressed(global.key_left) and diff > 1) diff--;
		else if (keyboard_check_pressed(global.key_right) and diff < MAXDIFF) diff++;
	} break;
	
	case 3:{
		if(keyboard_check_pressed(global.key_confirm)){
			room_goto(rBattle);
		}
	} break;
}


if (keyboard_check_pressed(ord("P"))){
	room_goto(rParty);
}




movement = sin(time/10) * 5;

time ++;