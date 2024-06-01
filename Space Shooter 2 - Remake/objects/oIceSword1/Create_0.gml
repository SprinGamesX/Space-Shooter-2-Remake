/// @description

// Inherit the parent event
event_inherited();
dis_travelled = 0;
echo = part_type_create();
part_type_alpha2(echo, 0.5, 0);
part_type_life(echo, seconds(0.5), seconds(0.5));
part_type_sprite(echo, sprite_index, 0, 0, 0);
max_dis = 0;