/// @description Insert description here
// You can write your code in this editor
// get is away from the screen
x = -100;
y = -100;

// Define variables
name = "Poison";
duration = 0;
max_duration = 0;
stat = 0;
scale = 0;
stack = 0;
max_stack = 50;
reciver = noone;
owner = noone;

get = function(){
	return scale * stack;
}

isOver = function(){
	return stack <= 0;
}

addStack = function(_stacks, _duration){
	stack = min(stack + _stacks, max_stack);
	duration = _duration;
}