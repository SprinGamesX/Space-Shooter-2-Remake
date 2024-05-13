// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum GAMEMODE{
	DOMAINS,
	ENDLESS,
	TRAINING
}




enum ELEMENT{
	ICE = 1,
	FIRE = 2,
	LIFE = 3,
	VENOM = 4,
	LIGHTNING = 5,
	STEEL = 6,
	QUANTUM = 7,
	NONE = 0
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
	QUANTUMDMG,
	ENERGYBOOST,
	DEF
}


// Enemy Movement Patterns
enum MOVEMENT_PATTERN{
	LINE,
	CURVE,
	CIRCLE,
	GRAVITATE
}

enum ENEMYSIZE{
	NORMAL,
	SMALL
}

// Chip Rarities
enum RARITY{
	COMMON = 0,
	RARE = 1,
	EPIC = 2,
	PERFECT = 3
}

enum CHIPSTAT{
	ATK = 0,
	HP = 1,
	CRITRATE = 2,
	CRITDMG = 3,
	SPD = 4,
	RES = 5,
	ASPD = 6,
	ICEDMG = 7,
	FIREDMG = 8,
	LIFEDMG = 9,
	VENOMDMG = 10,
	LIGHTNINGDMG = 11,
	STEELDMG = 12,
	QUANTUMDMG = 13,
	ENERGYBOOST = 14
}