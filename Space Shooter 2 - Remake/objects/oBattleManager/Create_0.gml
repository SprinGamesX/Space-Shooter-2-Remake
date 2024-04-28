/// @description Insert description here
// You can write your code in this editor
borders = 64;

// bg particle

global.background_system = part_system_create();
part_system_layer(global.background_system,layer_get_id("Back"));

alarm[0] = 2;
star = part_type_create();
part_type_life(star,seconds(20), seconds(20));
part_type_sprite(star, sStar, false, false, false);
part_type_speed(star, 2, 2, false, false);
part_type_direction(star, 179, 181, false, false);
part_type_alpha1(star, 0.2);

for (var i = 0; i < 400; i++)
	part_particles_create(global.background_system, random_range(0, room_width), random_range(5, room_height - 5), star, 1);
randomize();