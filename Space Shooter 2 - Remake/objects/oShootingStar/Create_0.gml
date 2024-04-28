/// @description Insert description here
// You can write your code in this editor
randomize();
direction = random_range(160, 200);
speed = random_range(4, 8);
image_xscale = 1.5;
image_yscale = 1.5;

star = part_type_create();
part_type_life(star,seconds(1), seconds(2));
part_type_sprite(star, sStar, false, false, false);
part_type_speed(star, 2, 2, false, false);
part_type_direction(star, direction - 180 - 5, direction - 180 + 5, false, false);
part_type_alpha3(star, 0.1, 0.3, 0);
part_type_scale(star, 0.5, 0.5);
