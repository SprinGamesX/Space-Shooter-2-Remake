// get is away from the screen
x = -100;
y = -100;

enum STAT{
	ATK, // increase/decreases ATK based on %
	HP, // increase/decreases HP based on %
	SPD, // increase/decreases SPD based on %
	DMG, // increase/decreases DMG based on %
	RES, // increase/decreases RES based on %
	RES_PEN, // increase/decreases RES_PEN based on %
	BA_BONUS, // increase/decreases BA_BONUS based on %
	SK_BONUS, // increase/decreases SK_BONUS based on %
	UT_BONUS, // increase/decreases UT_BONUS based on %
	DEF_PEN // increase/decreases DEF_PEN based on %
}

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