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
					_d = "Shoots 5 shards that deal ICE damage equal to [c_orange]" + sd + "%[c_white] of ATK. enemies hit will have a 65% base chance to have their DEF reduced by 20%.\n\nCD: " + sc + " seconds";
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
					_d = "Sends a barrage of tracking bullets that deals LIGHTNING damage around it equal to [c_orange]6x" + ud + "%[c_white] of ATK.\n\nCD: " + uc + " energy";
				break;
				case 3:
					_d = "When ENHANCED this ship will not consume AMMO. Additionally when ENHACNED the ultimate will fire 9 bullets instead of 6";
				break;
			} break;
		case 5:
			switch(_attack){
				case 0:
					_d = "Deals STEEL damage equal to [c_orange]" + bd + "%[c_white] of ATK.\n\nCD: " + bc + " seconds\nAmmo: " + ba + "\nReload CD: " + br + " seconds";
				break;
				case 1:
					_d = "Provides itself with a shield equal to [c_orange]10%[c_white] of HP.\n\nCD: " + sc + " seconds" ;
				break;
				case 2:
					_d = "Provides all allies with a shield equal to [c_orange]25%[c_white] of HP.\n\nCD: " + uc + " energy";
				break;
				case 3:
					_d = "When protected by a shield: BASIC-ATTACKS will be considered as SKILL damage and will deal AOE damage equal to [c_orange]" + sd + "%[c_white] of ATK. It will also not consume AMMO when protected.";
				break;
			} break;
		case 6:
			switch(_attack){
				case 0:
					_d = "Deals QUANTUM damage equal to [c_orange]" + bd + "%[c_white] of ATK.\n\nCD: " + bc + " seconds\nAmmo: " + ba + "\nReload CD: " + br + " seconds";
				break;
				case 1:
					_d = "Shoots a barrage of projectiles that deal damage equal to [c_orange]10x" + sd + "%[c_white] of ATKs.\n\nCD: " + sc + " seconds" ;
				break;
				case 2:
					_d = "Enters ENTANGLED state, When in ENTANGLED state this ship will shoot an additional FOLLOW-UP ATTACK on BASIC-ATTACK hit, dealing damage equal to [c_orange]" + ud +"%[c_white] of ATK.\n\nCD: " + uc + " energy";
				break;
				case 3:
					_d = "All shots this character shoots will also be applied with CRACKSHOT. CRACKSHOT will track the enemy after travelling a certain amount of distance.";
				break;
			} break;
		case 7:
			switch(_attack){
				case 0:
					_d = "Deals LIGNTNING damage equal to [c_orange]3x" + bd + "%[c_white] of ATK.\n\nCD: " + bc + " seconds\nAmmo: " + ba + "\nReload CD: " + br + " seconds";
				break;
				case 1:
					_d = "Generates [c_orange]30 [c_white]Energy to the first ship in the team.\n\nCD: " + sc + " seconds" ;
				break;
				case 2:
					_d = "Generates [c_orange]70 [c_white]Energy to the entire team except for itself, Additionally Give all ships 25% ENERGY BOOST for 20 seconds.\n\nCD: " + uc + " energy";
				break;
				case 3:
					_d = "Increase the ENERGY BOOST of all allies by 10%.";
				break;
			} break;
		case 8:
			switch(_attack){
				case 0:
					_d = "Deals ICE damage equal to [c_orange]" + bd + "%[c_white] of ATK.\n\nCD: " + bc + " seconds\nAmmo: " + ba + "\nReload CD: " + br + " seconds";
				break;
				case 1:
					_d = "Applies Target to the closest elite, When an enemy is targeted this ships' projectiles will only hit this enemy and will ignore all other enemies.\n\nCD: " + sc + " seconds" ;
				break;
				case 2:
					_d = "Enters Glacial Hunt state, when in that state, Hitting an enemy will trigger a follow up attack that deals ICE damage equal to [c_orange] " + ud + "[c_white] of ATK to the Target enemy.\n\nCD: " + uc + " energy";
				break;
				case 3:
					_d = "Hitting a Target enemy has 30% increased CRIT RATE.";
				break;
			} break;
		case 9:
			switch(_attack){
				case 0:
					_d = "Deals FIRE damage equal to [c_orange]2x" + bd + "%[c_white] of ATK.\n\nCD: " + bc + " seconds\nAmmo: " + ba + "\nReload CD: " + br + " seconds";
				break;
				case 1:
					_d = "Generates 30 AMMO for all allies.\n\nCD: " + sc + " seconds" ;
				break;
				case 2:
					_d = "Gives all allies: 10% ASPD, 20 MAX AMMO and 20% DMG BONUS.\n\nCD: " + uc + " energy";
				break;
				case 3:
					_d = "When an enemy is killed, regenerate 5 AMMO for all allies.";
				break;
			} break;
		case 10:
			switch(_attack){
				case 0:
					_d = "Deals ICE damage equal to [c_orange]" + bd + "%[c_white] of ATK.\n\nCD: " + bc + " seconds\nAmmo: " + ba + "\nReload CD: " + br + " seconds";
				break;
				case 1:
					_d = "Summons Icy Cannon, Icy Cannon will shoot every 0.5 seconds at the closest enemy, dealing AOE ICE damage equal to [c_orange]" + bd + "%[c_white] of ATK and has a 100% chance to decrease the enemy's SPD by 50% for 15 seconds.\n\nCD: " + sc + " seconds" ;
				break;
				case 2:
					_d = "Fires a precise bullet that seeks the elite enemy and has a 100% chance to decrease their SPD by 90% for 15 seconds.\n\nCD: " + uc + " energy";
				break;
				case 3:
					_d = "Bullets fired by this ship will have 100% chance to decrease the hit enemy's SPD by 10% for 15 seconds.";
				break;
			} break;
		case 11:
			switch(_attack){
				case 0:
					_d = "Deals LIFE damage equal to [c_orange]" + bd + "%[c_white] of ATK.\n\nCD: " + bc + " seconds\nAmmo: " + ba + "\nReload CD: " + br + " seconds";
				break;
				case 1:
					_d = "Consume [c_orange]40%[c_white] of HP and enhances BASIC ATTACK for 10 seconds, enhanced BASIC ATTACK deals LIFE damage equal to [c_orange]2x" + bd + "%[c_white] of ATK and [c_orange]2x" + sd + "%[c_white] of HP.\n\nCD: " + sc + " seconds" ;
				break;
				case 2:
					_d = "Consume [c_orange]50%[c_white] of HP and gain a shield equal to [c_orange]25%[c_white] of HP.\n\nCD: " + uc + " energy";
				break;
				case 3:
					_d = "For every 1% of difference between MAX HP and current HP, gain 1% DMG BONUS.";
				break;
			} break;
		case 12:
			switch(_attack){
				case 0:
					_d = "Deals VENOM damage equal to [c_orange]2x" + bd + "%[c_white] of ATK.\n\nCD: " + bc + " seconds\nAmmo: " + ba + "\nReload CD: " + br + " seconds";
				break;
				case 1:
					_d = "Summon two Buffers that fire a soundwave that deals VENOM damage equal to [c_orange]10x" + sd + "%[c_white] of ATK and applies Vibration.\n\nVibration:\nDeals DoT VENOM damage equal to [c_orange]50%[c_white] of ATK.\n\nCD: " + sc + " seconds" ;
				break;
				case 2:
					_d = "Instantly inflicts all enemies with 5 stacks of Strong Vibration.\n\nStrong Vibration:\nDeals DoT VENOM damage equal to [c_orange]300%[c_white] of ATK.\n\nCD: " + uc + " energy";
				break;
				case 3:
					_d = "Each time any type of POISON is triggered gain 1% ATK bonus up to 100%.";
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
		case 7:
			switch(_num){
				case 1: return "Passive: \nWhen scoring a CRIT generate 1 ENERGY";
				case 4: return "Passive: \nWhen an ally uses an ultimate: Regenerate energy equal 5% of the ally's ultimate cost";
				case 9: return "Passive: \nUltimate now increases all allies ultimate damage by 75% for 15 seconds";
		} break;
		case 8:
			switch(_num){
				case 1: return "Passive: \nTargeted enemies have their ICE RES decreased by 25%";
				case 4: return "Passive: \nWhen activating the ultimate: reactivate skill";
				case 9: return "Passive: \nWhen an enemy is targeted, fired bullets will now be shot towards the targeted enemy";
		} break;
		case 9:
			switch(_num){
				case 1: return "Passive: \nSkill Additionally increases all allies ASPD by 25% for 15 seconds";
				case 4: return "Passive: \nUsing ultimate will restore 10 ENERGY.";
				case 9: return "Passive: \nSPD is increased by 25%";
		} break;
		case 10:
			switch(_num){
				case 1: return "Passive: \nWhen Icy Cannon shoots: Provide the active ship a shield equal to 1% of ATK";
				case 4: return "Passive: \nWhen any ally hits an enemy, decrease its SPD by 10%";
				case 9: return "Passive: \nIcy Cannon now fires 2 additional bullets";
		} break;
		case 11:
			switch(_num){
				case 1: return "Passive: \nSkill increaeses ASPD by 50% for 10 seconds";
				case 4: return "Passive: \nWhen an enhanced BASIC-ATTACK hits, recover 1 AMMO";
				case 9: return "Passive: \nWhen HP is below 25% gain 20% DEF PEN";
		} break;
		case 12:
			switch(_num){
				case 1: return "Passive: \nEnemies hit by Soundwave (Skill) will have a 150% chance to have their DEF decreaed by 20% for 10 seconds";
				case 4: return "Passive: \nPassive now additionally has a 75% chance to inflict the poisoned enemy with -2% VENOM RES for 3 seconds, this can stack up to 5 times";
				case 9: return "Passive: \nWhen using the ultimate additionally trigger all DoTs that are on ELITE enemies";
		} break;
		
	}
	return "Passive was not written yet..."
}