/// @description

dur = seconds(5);


// particles
part_sys = part_system_create();
part_system_depth(part_sys, layer_get_depth(layer_get_id("Back")));
part = part_type_create();
part_type_sprite(part, sPixel, 0, 0, 0);
part_type_color2(part, c_black, c_purple);
part_type_life(part, seconds(2), seconds(2));
part_type_speed(part, 5, 5.25, 0, 0);
part_type_alpha3(part,1, 0.9, 0);
part_type_size(part, 1.5, 2, 0, 0);