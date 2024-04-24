// get is away from the screen
x = -100;
y = -100;

enum STAT{
	ATK, // increase/decreases ATK based on %
	HP, // increase/decreases HP based on %
	SPD, // increase/decreases SPEED based on %
	ASPD, // increase/decreases ATTACK SPEED based on %
	DMG, // increase/decreases DMG based on %
	RES, // increase/decreases RESISTANCE based on %
	RES_PEN, // increase/decreases RESISTANCE PENETRATION based on %
	BA_BONUS, // increase/decreases BASIC ATTACK DMG based on %
	SK_BONUS, // increase/decreases SKILL DMG based on %
	UT_BONUS, // increase/decreases ULTIMATE DMG based on %
	DEF_PEN // increase/decreases DEFENSE PENENTRATION based on %
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