/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

image_angle++;

if (keyboard_check_pressed(ord("K"))){
	//ApplyDebuff(self, "Debug", false, false, STAT.DMG_RECIVED, 0.5, seconds(5),,,,true);
	//ApplyTeamBuff("Debug", false, true, STAT.MAX_AMMO, 10, seconds(5),,,,true);
	GenerateEnergy(oTeamManager.getActiveShip(), 50);
}