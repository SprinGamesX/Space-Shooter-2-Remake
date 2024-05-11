/// @description
global.history = ds_stack_create();
savelast = true;
last_room = 0;


goBack = function(){
	if (ds_stack_size(global.history) > 0){
		room_goto(ds_stack_pop(global.history));
		savelast = false;
		
	}
}

getLastRoom = function(){
	return last_room;
}