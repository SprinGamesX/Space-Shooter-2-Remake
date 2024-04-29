// get is away from the screen
x = -100;
y = -100;

// Define variables
name = "";
multiplier = 0;
infinite = false;
duration = 0;
stat = 0;
scale = 0;
stack = 0;
max_stack = 0;

get = function(){
	return scale * multiplier * stack;
}

isOver = function(){
	return duration <= 0;
}

addStack = function(_stacks, _duration){
	stack = min(stack + _stacks, max_stack);
	duration = _duration;
}