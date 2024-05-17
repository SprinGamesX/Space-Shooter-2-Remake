/// @description



if (duration > 0){
	duration--;
}
else {
	heal();
	if (stack <= 0) instance_destroy(self);
}
