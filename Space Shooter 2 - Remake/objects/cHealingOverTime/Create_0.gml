/// @description
// get is away from the screen
x = -100;
y = -100;

// Define variables
name = "";
multiplier = 0;
infinite = false;
duration = 0;
max_duration = duration;
stat = STAT.HEALING_OVER_TIME;
scale = 0;
stack = 0;
max_stack = 0;
target = noone;

isOver = function(){
	return stack <= 0;
}

addStack = function(_stacks, _duration){
	stack = min(stack + _stacks, max_stack);
	duration = _duration;
}

heal = function(){
	if (instance_exists(target) and instance_exists(owner)){
		RestoreHp(target, scale * owner.getMaxHp());
	}
	stack--;
	duration = max_duration;
}