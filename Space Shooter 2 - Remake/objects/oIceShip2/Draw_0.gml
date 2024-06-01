/// @description

// Inherit the parent event
event_inherited();

if (instance_exists(target)){
	draw_sprite(sIceMark, target_index, target.x, target.y);
	if (target_index < 4) target_index += 0.1;
}