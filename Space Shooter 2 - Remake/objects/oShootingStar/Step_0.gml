/// @description Insert description here
// You can write your code in this editor
part_particles_create(global.background_system, x, y, star, 1);
image_alpha = random_range(0.2, 0.5);
if (x < -50) instance_destroy();