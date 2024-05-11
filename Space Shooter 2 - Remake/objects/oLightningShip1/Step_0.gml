/// @description

// Inherit the parent event
event_inherited();

if (enhanced_timer > 0){
	enhanced_timer--;
	part_type_direction(part, 0, 360, 0,0);
	part_particles_create(global.particleSystem, x, y, part, 1);
}
else enhanced = false;

