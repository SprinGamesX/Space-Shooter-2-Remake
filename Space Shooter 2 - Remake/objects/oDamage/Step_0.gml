/// @description Insert description here
// You can write your code in this editor
lifetime--;
alpha = lifetime/mLifetime;
speed -= grv;
if (lifetime <= 0) instance_destroy();