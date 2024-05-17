// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GetDescForAttack(_id, _attack){
	
	var _s = GetShipDetails(_id);
	var _d = "";
	
	var bd = string((_s.base_ba_scale * 100));
	var bc = string((_s.base_ba_cd/60));
	var ba = string(_s.base_ammo);
	var br = string(_s.base_reload_cd/60);
	
	var sd = string((_s.base_skill_scale * 100));
	var sc = string((_s.base_skill_cd/60));
	
	var ud = string((_s.base_ult_scale * 100));
	var uc = string(_s.max_energy);
	
	switch(_id){
		case 0:
			switch(_attack){
				case 0:
					_d = "Deals ICE damage equal to [c_orange]" + bd + "%[c_white] of ATK.\n\nCD: " + bc + " seconds\nAmmo: " + ba + "\nReload CD: " + br + " seconds";
				break;
				case 1:
					_d = "Shoots 5 shards that deal ICE damage equal to [c_orange]" + sd + "%[c_white] of ATK. enemies hit will have their DEF reduced by 20%.\n\nCD: " + sc + " seconds";
				break;
				case 2:
					_d = "Shoots a shard that deals ICE damage equal to [c_orange]" + ud + "%[c_white] of ATK and can pierce five enemies, each enemy hit will trigger 3 follow up attacks.\n\nCD: " + uc + " energy";
				break;
				case 3:
					_d = "Starts with a follow up attack chance of 0. each basic attack will increase this chance by 1% up to 10%. each follow up attack deals damage equal to [c_orange]" + string((_s.base_ba_scale/2 * 100)) + "%[c_white] of ATK.";
				break;
			} break;
		case 1:
			switch(_attack){
				case 0:
					_d = "Deals FIRE damage equal to [c_orange]" + bd + "%[c_white] of ATK.\n\nCD: " + bc + " seconds\nAmmo: " + ba + "\nReload CD: " + br + " seconds";
				break;
				case 1:
					_d = "Gain 200% ASPD for 10 seconds.\n\nCD: " + sc + " seconds";
				break;
				case 2:
					_d = "Enters FIRED UP state. When in FIRED UP state basic attacks will now have 2 AOE and deal FIRE damage equal to [c_orange]" + ud + "%[c_white] of ATK and count as ULTIMATE damage, FIRED UP state will last for 10 seconds.\n\nCD: " + uc + " energy";
				break;
				case 3:
					_d = "When in FIRED UP state this ship does not consume AMMO.";
				break;
			} break;
		case 2:
			switch(_attack){
				case 0:
					_d = "Deals LIFE damage equal to [c_orange]" + bd + "%[c_white] of HP.\n\nCD: " + bc + " seconds\nAmmo: " + ba + "\nReload CD: " + br + " seconds";
				break;
				case 1:
					_d = "Heals itself for [c_orange]15%[c_white] of HP.\n\nCD: " + sc + " seconds";
				break;
				case 2:
					_d = "Heals all allies including itself for [c_orange]50%[c_white] of HP.\n\nCD: " + uc + " energy";
				break;
				case 3:
					_d = "When using BASIC-ATTACKS consume 1% of its HP.";
				break;
			} break;
		case 3:
			switch(_attack){
				case 0:
					_d = "Deals VENOM damage equal to [c_orange]" + bd + "%[c_white] of ATK.\n\nCD: " + bc + " seconds\nAmmo: " + ba + "\nReload CD: " + br + " seconds";
				break;
				case 1:
					_d = "Increases its own ATK by 50% stacking up to 3 times.\n\nCD: " + sc + " seconds" ;
				break;
				case 2:
					_d = "Deals VENOM damage around it equal to [c_orange]" + ud + "%[c_white] of ATK.\n\nCD: " + uc + " energy";
				break;
				case 3:
					_d = "Increases ATK by 10% for all allies.";
				break;
			} break;
		case 4:
			switch(_attack){
				case 0:
					_d = "Deals LIGHTNING damage equal to [c_orange]" + bd + "%[c_white] of ATK.\n\nCD: " + bc + " seconds\nAmmo: " + ba + "\nReload CD: " + br + " seconds";
				break;
				case 1:
					_d = "Enters ENHANCED state, when in ENHANCED state BASIC-ATTACKS will have increased SPEED and will BOUNCE 3 times.\n\nCD: " + sc + " seconds" ;
				break;
				case 2:
					_d = "Deals VENOM damage around it equal to [c_orange]" + ud + "%[c_white] of ATK.\n\nCD: " + uc + " energy";
				break;
				case 3:
					_d = "Increases ATK by 10% for all allies.";
				break;
			} break;
		
	}
	
	instance_destroy(_s);
	return _d;
	
}

function GetDescForStat(_details){
	return GetChipStatString((_details[0])) + " +" + string(_details[1] * 100) + "%";
}

function GetDescForPassive(_id, _num){
	switch(_id){
		case 0:
			switch(_num){
				case 1: return "Passive: \nUpon using skill: increase ATK by 10% for 5 seconds";
				case 4: return "Passive: \nFollow-up attack chance now starts with 10% and can scale up to 25% instead of 10%";
				case 9: return "Passive: \nFollow-up attacks deal ICE damage equal to 20% of ATK instead of 10%";
		} break;
		case 1:
			switch(_num){
				case 1: return "Passive: \nUpon using ultimate: Increase RES by 15% for 10 seconds";
				case 4: return "Passive: \nUpon using skill additionally fire a ring of fire that deals FIRE dmg equal to 10% of ATK";
				case 9: return "Passive: \nWhen hit: Increase ATK by 50% for 4 seconds";
		} break;
		case 2:
			switch(_num){
				case 1: return "Passive: \nSkill now also heals allies for 10% of HP";
				case 4: return "Passive: \nWhen HP changes gain 1 ENERGY";
				case 9: return "Passive: \nWhen healing allies with the ultimate grant the active ship healing over time equal to 5% of HP for 5 seconds";
		} break;
		case 3:
			switch(_num){
				case 1: return "Passive: \nOn the start of the battle grant 15% ATK to all allies instead of 10%";
				case 4: return "Passive: \nSkill addtionally grants all allies 5% ATK stacking up to 3 times";
				case 9: return "Passive: \nEnemies hit by the ultimate will have their DEF reduced by 10% for 20 seconds";
		} break;
		case 4:
			switch(_num){
				case 1: return "Passive: \nWhen enhanced gain 20% ATK";
				case 4: return "Passive: \nEnhanced basic attack now bounces 2 more times";
				case 9: return "Passive: \nIncrease AMMO by 10";
		} break;
		case 5:
			switch(_num){
				case 1: return "Passive: \nWhen shielded CRITRATE increases by 20%";
				case 4: return "Passive: \nSkill now addtionally gives all allies a shield equal to 5% of HP";
				case 9: return "Passive: \nIf this ship does not have a shield when hitting an enemy: gain a shield equal to 1% of HP";
		} break;
		case 6:
			switch(_num){
				case 1: return "Passive: \nUltimate now grants 50% ASPD for 5 seconds";
				case 4: return "Passive: \nWhen skill hits an elite enemy(or boss) give all allies 5% CRITDMG stacking up to 10 times and lasting for 10 seconds";
				case 9: return "Passive: \nWhen in ENTANGLED state: this ship will not consume AMMO";
		} break;
		
	}
	return "Passive was not written yet..."
}