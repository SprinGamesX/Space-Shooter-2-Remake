/// @description Insert description here
// You can write your code in this editor


duration--;
if (instance_exists(reciver) and instance_exists(owner) and duration == 0 and !ongoing){
	triggerDot();
	if (stack <= 0) instance_destroy();
}
