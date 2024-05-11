/// @description return to previous if exists
if (ds_stack_size(global.history) > 0){
	room_goto(ds_stack_pop(global.history));
	savelast = false;
}
