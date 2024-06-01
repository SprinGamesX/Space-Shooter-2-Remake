/// @description

// Inherit the parent event
event_inherited();

if (!instance_exists(target) and target != noone){
	target = noone;
	GenerateEnergy(self, 50);
}

if (target_timer > 0){ target_timer-- }
if (target_timer == 0){
	target_timer = -1;
	target = noone;
	sprite_index = sIceShip2_closing;
	image_speed = 1;
}
if (ultimate > 0) ultimate--;