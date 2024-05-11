/// @description

// Inherit the parent event
event_inherited();

sys = part_system_create();
part_system_depth(sys, depth - 1)


element = ELEMENT.ICE;
direction = 180;
movement = -1;

base_hp = 1500;
hp = base_hp;
base_dmg = 10;
base_def = 500;

invis = false;


// Attacks
alarm[0] = seconds(5);
alarm[1] = seconds(15);
alarm[2] = seconds(30);
alarm[3] = seconds(1);
alarm[4] = seconds(3);

onAttackFinish = function(){
	isAttacking = false;
}

// Particle
part = part_type_create();
part_type_sprite(part, sPixel, 0, 0, 0);
part_type_alpha3(part,0.5, 1, 0.1);
part_type_life(part, seconds(0.2), seconds(1));
part_type_orientation(part, 0, 359, 0, 1, 1);
part_type_color2(part, c_white ,c_aqua);
part_type_speed(part, 0.1, 0.3, 0, 0);