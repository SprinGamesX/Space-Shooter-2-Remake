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
		
	}
	
	instance_destroy(_s);
	return _d;
	
}

function GetDescForStat(_details){
	return GetChipStatString((_details[0])) + " +" + string(_details[1] * 100) + "%";
}