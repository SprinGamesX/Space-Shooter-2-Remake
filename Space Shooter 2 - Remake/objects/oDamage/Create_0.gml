/// @description Insert description here
// You can write your code in this editor
randomize();
text = "";
lifetime = seconds(1);
mLifetime = lifetime;
speed = 5;
direction = 90 + random_range(-10, 10);
alpha = 1;
grv = 0.1;
color = c_white;

onCreate = function(_text, _color){
	text = _text;
	color = _color;
}