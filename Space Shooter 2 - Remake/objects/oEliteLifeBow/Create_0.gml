/// @description

// Inherit the parent event
event_inherited();

sys = part_system_create();
part_system_depth(sys, depth - 1)


element = ELEMENT.LIFE;
direction = 90;
movement = MOVEMENT_PATTERN.SPECIAL;

base_hp = 200;
hp = base_hp;
base_dmg = 10;
base_def = 120;
base_spd = 1;
time = 0;
consume_time = -1;
aim = 1;




// Attacks


alarm[0] = seconds(1);
alarm[1] = seconds(5);
alarm[2] = seconds(10);
alarm[3] = seconds(60);
alarm[4] = seconds(5);

// Particle
part = part_type_create();
part_type_sprite(part, sLifeLeaf, 0, 0, 0);
part_type_alpha2(part,0.5, 0);
part_type_life(part, seconds(0.2), seconds(0.5));
part_type_orientation(part, 0, 359, 0.1, 0, 1);
part_type_speed(part, 0.5, 1, 0, 0);