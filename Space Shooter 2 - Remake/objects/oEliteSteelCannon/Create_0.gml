/// @description

// Inherit the parent event
event_inherited();

sys = part_system_create();
part_system_depth(sys, depth - 1)


element = ELEMENT.STEEL;
direction = 90;
movement = -1;

base_hp = 600;
hp = base_hp;
base_dmg = 10;
base_def = 100;
base_spd = 1;

rot = 180;
shield_exists = false;
mini_cannons = [noone, noone];
recoil = 0;

alarm[0] = seconds(1);
alarm[1] = seconds(1);
alarm[2] = seconds(15);
alarm[3] = seconds(5);
alarm[4] = seconds(3);

// Particle
part = part_type_create();
part_type_sprite(part, sPixel, 0, 0, 0);
part_type_alpha3(part,0.5, 1, 0.1);
part_type_life(part, seconds(0.2), seconds(0.5));
part_type_orientation(part, 0, 359, 0, 1, 1);
part_type_color2(part, make_color_rgb(255, 136, 0) ,make_color_rgb(237, 87, 36));
part_type_speed(part, 1, 2, -0.005, 0);