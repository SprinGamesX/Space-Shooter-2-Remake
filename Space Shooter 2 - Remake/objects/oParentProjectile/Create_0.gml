/// @description Insert description here
// You can write your code in this editor

hitlist = ds_list_create();
last_hit_enemy = noone;

onCreation = function(){
	speed = spd;
	direction = dir;
}

onHit = function(_enemy){
	CreateAoe(parent, x, y, atk_type, element, aoe, last_hit_enemy);
	show_debug_message(_enemy);
}