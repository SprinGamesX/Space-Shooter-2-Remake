/// @description

// Inherit the parent event
event_inherited();

// particles
for (var i = 0; i < 0; i++){
	part_type_direction(part, 85, 95, -0.1, 0);
	part_type_life(part, seconds(3), seconds(3))
	var _w = sprite_get_width(sprite_index) / 2;
	var _h = sprite_get_height(sprite_index) / 2;
	part_particles_create(sys, x + random_range(-_w, _w) , y + random_range(-_h, _h), part, 1);
}

if (!instance_exists(mini_cannons[0])) {
	mini_cannons[0] = noone;
}
if (!instance_exists(mini_cannons[1])) {
	mini_cannons[1] = noone;
}

var _s = oTeamManager.getActiveShip();
rot = point_direction(x, y, _s.x, _s.y);

if (recoil > 0) recoil -= 0.25;

image_angle += base_spd * (1 + GetBuffByType(self, STAT.SPD));
