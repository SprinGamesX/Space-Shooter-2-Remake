/// @description

// Inherit the parent event
event_inherited();

// particles
for (var i = 0; i < 2; i++){
	part_type_direction(part, 0, 360, 0, 0);
	part_type_life(part, seconds(3), seconds(3))
	var _w = sprite_get_width(sprite_index) / 2;
	var _h = sprite_get_height(sprite_index) / 2;
	part_particles_create(sys, x + random_range(-_w, _w) , y + random_range(-_h, _h), part, 1);
}
if (consume_time > 0) consume_time--;
if (consume_time == 0){
	show_debug_message("CONSUME");
	var _list = ds_list_create();
	var _nums = collision_rectangle_list(0, 0, room_width, room_height, oEnemyNormal,0,true,_list,false);
	for (var i = 0; i < _nums; i++){
		instance_destroy(_list[|i]);
		hp += base_hp/10;
		if (hp > base_hp) hp = base_hp;
	}

	ds_list_destroy(_list);
	consume_time = -1;
}

if (aim > 0){
	var _ship = oTeamManager.getActiveShip();
	direction = point_direction(x, y, _ship.x, _ship.y);
}
else direction = 180;

// movement
y = base_y + (100 * sin(time/30));
time += base_spd * (1 + GetBuffByType(self, STAT.SPD));

image_angle = direction - 180;