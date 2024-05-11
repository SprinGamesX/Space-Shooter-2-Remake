/// @description

// Inherit the parent event
event_inherited();

// particles
for (var i = 0; i < 3; i++){
	part_type_direction(part, 0, 359, 0, 0);
	part_type_life(part, seconds(2), seconds(2))
	var _w = sprite_get_width(sprite_index) / 2;
	var _h = sprite_get_height(sprite_index) / 2;
	part_particles_create(sys, x + random_range(-_w, _w) , y + random_range(-_h, _h), part, 1);
}
if (invis) image_alpha = 0.1;
else image_alpha = 1;


image_angle+=1;