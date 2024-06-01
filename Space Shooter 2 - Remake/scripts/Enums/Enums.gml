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
	MISC,
	EXPLOSIVE,
	SAPPED,
	SHOCKED,
	DOT,
}

enum STAT{
	// Shard Stats
	SPD, // increase/decreases SPEED based on %
	DMG, // increase/decreases DMG based on %
	RES, // increase/decreases RESISTANCE based on %
	
	// Ship
	ATK, // increase/decreases ATK based on %
	HP, // increase/decreases HP based on %
	ASPD, // increase/decreases ATTACK SPEED based on %
	RES_PEN, // increase/decreases RESISTANCE PENETRATION based on %
	BA_BONUS, // increase/decreases BASIC ATTACK DMG based on %
	SK_BONUS, // increase/decreases SKILL DMG based on %
	UT_BONUS, // increase/decreases ULTIMATE DMG based on %
	FUA_BONUS, // increase/decreases FOLLOW-UP ATTACK DMG based on %
	DOT_BONUS, // increase/decreases DAMAGE OVER TIME based on %
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
	MAX_AMMO,
	HEALING_OVER_TIME,
	EFFECT_CHANCE,
	HEALING_BONUS,
	
	// Enemy
	DEF,
	DMG_RECIVED,
	ICERES,
	FIRERES,
	LIFERES,
	VENOMRES,
	LIGHTNINGRES,
	STEELRES,
	QUANTUMRES,
	COOLDOWN,
	EFFECT_RES,
}


// Enemy Movement Patterns
enum MOVEMENT_PATTERN{
	LINE,
	CURVE,
	CIRCLE,
	GRAVITATE,
	SPECIAL
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
	ENERGYBOOST = 14,
	HEALINGBONUS = 15,
	EFFECTCHANCE = 16,
}

enum DIRECTION{
	LEFT = 180,
	RIGHT = 0,
	DOWN = 270,
	UP = 90,
}

enum DOMAIN{
	COMBAT = 0,
	CHALLANGE = 1,
	MYSTERY = 2,
	HEAL = 3,
	BOSS = 4
}