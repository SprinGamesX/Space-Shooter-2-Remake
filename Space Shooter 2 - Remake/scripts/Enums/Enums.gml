// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
enum ELEMENT{
	ICE,
	FIRE,
	LIFE,
	VENOM,
	LIGHTNING,
	STEEL,
	QUANTUM,
	NONE
}

enum ATTACK_TYPE{
	BASIC_ATTACK,
	SKILL,
	ULTIMATE,
	FOLLOWUP,
	AOE,
	MISC
}

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
	DEF_PEN, // increase/decreases DEFENSE PENENTRATION based on %
	CRIT,
	CRITDMG,
	ICEDMG,
	FIREDMG,
	LIFEDMG,
	VENOMDMG,
	LIGHTNINGDMG,
	STEELDMG,
	QUANTUMDMG
}

enum ENEMY_STAT{
	DMG,
	HP,
	DEF,
	RES,
	
}	

// Elemental debuffs and more unusual debuffs
enum MOVEMENT_PATTERN{
	LINE,
	CURVE,
	CIRCLE,
	GRAVITATE
}

