/// @description

// Inherit the parent event
event_inherited();

onEntrance = function(){
	if (image_xscale < 1){
		image_xscale += 0.1;
		image_yscale += 0.1;
	}
	else entrance_done = true;
}
