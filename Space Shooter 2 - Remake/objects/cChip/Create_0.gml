/// @description Insert description here
// You can write your code in this editor
uuid = 0;
rarity = RARITY.COMMON;
scale = 0;
stat = CHIPSTAT.ATK;
ownerId = -1;
ownerSlot = -1;



get = function(){
	return scale;
}

compress = function(){
	return [uuid, rarity, scale, stat, ownerId, ownerSlot];
}