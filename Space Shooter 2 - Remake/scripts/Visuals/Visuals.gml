// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GetTrailByElement(_element){
	var _part = part_type_create();
	
	switch(_element){
		case ELEMENT.ICE:{
			part_type_sprite(_part, sPixel, 0, 0, 0);
			part_type_alpha2(_part, 0.4, 0);
			part_type_life(_part, seconds(0.2), seconds(1));
			part_type_orientation(_part, 0, 359, 0, 1, 1);
			part_type_color1(_part, c_aqua);
			part_type_speed(_part, 0.1, 1, -0.01, 0);
		
		} break;
		case ELEMENT.FIRE:{
			part_type_sprite(_part, sPixel, 0, 0, 0);
			part_type_alpha2(_part, 0.4, 0);
			part_type_life(_part, seconds(0.4), seconds(1));
			part_type_orientation(_part, 0, 359, 0, 1, 1);
			part_type_color3(_part, c_yellow, c_orange, c_red);
			part_type_speed(_part, 0.5, 3, -0.05, 0);
		
		} break;
		case ELEMENT.LIFE:{
			part_type_sprite(_part, sLifeLeaf, 0, 0, 0);
			part_type_alpha2(_part, 0.7, 0);
			part_type_life(_part, seconds(0.7), seconds(1.2));
			part_type_orientation(_part, 0, 359, 0, 1, 1);
			part_type_speed(_part, 0.5, 3, -0.02, 0);
		
		} break;
		case ELEMENT.LIGHTNING:{
			part_type_sprite(_part, sLightningParticle, 1, 0, 0);
			part_type_alpha2(_part, 0.7, 0);
			part_type_life(_part, seconds(0.2), seconds(0.5));
			part_type_orientation(_part, 0, 359, 100, 1, 1);
			part_type_speed(_part, 3, 5, -0.02, 0);
		
		} break;
		case ELEMENT.STEEL:{
			part_type_sprite(_part, sprite_index, 1, 0, 0);
			part_type_alpha2(_part, 0.2, 0);
			part_type_life(_part, seconds(0.1), seconds(0.1));
			part_type_orientation(_part, image_angle, image_angle, 0, 1, 1);
			part_type_speed(_part, 0, 0, 0, 0);
		
		} break;
		case ELEMENT.QUANTUM:{
			part_type_sprite(_part, sPixel, 0, 0, 0);
			part_type_alpha2(_part, 0.9, 0);
			part_type_life(_part, seconds(0.4), seconds(1));
			part_type_orientation(_part, 0, 359, 0, 0, 1);
			part_type_color1(_part, make_color_rgb(85, 73, 216));
			part_type_speed(_part, 2, 2, -0.05, 0);
		
		} break;
		case ELEMENT.VENOM:{
			part_type_sprite(_part, sVenomParticle, 0, 0, 1);
			part_type_alpha2(_part, 0.5, 0);
			part_type_life(_part, seconds(0.3), seconds(0.5));
			part_type_orientation(_part, 0, 359, 0, 1, 1);
			part_type_speed(_part, 0.5, 3, -0.04, 0);
		
		} break;
	}
	return _part;
}

function SpawnParticleByElement(_element,_trail_type){
	switch(_element){
		case ELEMENT.ICE:{
			part_type_direction(_trail_type, direction + 170, direction + 190, 0, 0);
			var _w = sprite_get_width(sprite_index) / 2;
			var _h = sprite_get_height(sprite_index) / 2;
			part_particles_create(global.particleSystem, x + random_range(-_w, _w) , y + random_range(-_h, _h), _trail_type, 1);
		} break;
		case ELEMENT.FIRE:{
			part_type_direction(_trail_type, direction + 170, direction + 190, 0, 0);
			var _w = sprite_get_width(sprite_index) / 2;
			var _h = sprite_get_height(sprite_index) / 2;
			part_particles_create(global.particleSystem, x + random_range(-_w, _w) , y + random_range(-_h, _h), _trail_type, 1);
		} break;
		case ELEMENT.LIFE:{
			if (RollChance(0.5)){
				part_type_color1(_trail_type, c_green);
			} else part_type_color1(_trail_type, make_color_rgb(81, 55, 55));
			part_type_direction(_trail_type, direction + 160, direction + 200, random_range(-1, 1), 0);
			var _w = sprite_get_width(sprite_index) / 2;
			var _h = sprite_get_height(sprite_index) / 2;
			part_particles_create(global.particleSystem, x + random_range(-_w, _w) , y + random_range(-_h, _h), _trail_type, 1);
		} break;
		case ELEMENT.LIGHTNING:{
			part_type_direction(_trail_type, direction + 170, direction + 190, 0, 0);
			var _w = sprite_get_width(sprite_index) / 2;
			var _h = sprite_get_height(sprite_index) / 2;
			part_particles_create(global.particleSystem, x + random_range(-_w, _w) , y + random_range(-_h, _h), _trail_type, 1);
		} break;
		case ELEMENT.STEEL:{
			part_type_direction(_trail_type, direction + 180, direction + 180, 0, 0);
			var _w = sprite_get_width(sprite_index) / 2;
			var _h = sprite_get_height(sprite_index) / 2;
			part_particles_create(global.particleSystem, x, y, _trail_type, 1);
		} break;
		case ELEMENT.QUANTUM:{
			part_type_direction(_trail_type, direction + 179, direction + 181, 0, 0);
			var _w = sprite_get_width(sprite_index) / 2;
			var _h = sprite_get_height(sprite_index) / 2;
			part_particles_create(global.particleSystem, x, y, _trail_type, 1);
		} break;
		case ELEMENT.VENOM:{
			part_type_direction(_trail_type, direction + 160, direction + 200, random_range(-1, 1), 0);
			var _w = sprite_get_width(sprite_index) / 4;
			var _h = sprite_get_height(sprite_index) / 4;
			part_particles_create(global.particleSystem, x + random_range(-_w, _w) , y + random_range(-_h, _h), _trail_type, 1);
		} break;
	
	}
}