/// @description star creation

part_particles_create(global.background_system, room_width + 15, random_range(5, room_height - 5), star, 1);

if (0.01 > random(1)){
	instance_create_layer(room_width + 15, random_range(-50, room_height +50), "Back", oShootingStar);
}

alarm[0] = 2;