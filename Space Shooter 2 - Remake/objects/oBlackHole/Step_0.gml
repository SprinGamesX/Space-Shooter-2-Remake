/// @description
for (var i = 0; i < 360 and dur > 0; i += 2){
	part_type_direction(part, i, i, 1, 0);
	part_particles_create(part_sys, room_width / 2, room_height / 2, part, 1);
}

dur--;
if (dur <= -seconds(5)) instance_destroy();