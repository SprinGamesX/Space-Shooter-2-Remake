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

get = function(){
	return scale * multiplier;
}

isOver = function(){
	return duration <= 0;
}