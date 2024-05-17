/// @description Insert description here
// You can write your code in this editor
// get is away from the screen
x = -100;
y = -100;

// Define variables
name = "Poison";
duration = 0;
max_duration = 0;
stat = 0;
scale = 0;
stack = 0;
max_stack = 50;
reciver = noone;
owner = noone;
ongoing = false;

get = function(){
	return scale * stack;
}

isOver = function(){
	return stack <= 0;
}

addStack = function(_stacks, _duration){
	if (stack <= 0) duration = _duration;
	stack = min(stack + _stacks, max_stack);
	
}

triggerDot = function(){
	ongoing = true;
	var attacker = owner;
	
	var base_dmg = scale * attacker.getAtk();
	
	// Enemy def calculation
	var def = GetDefense(attacker, reciver);
	
	// Enemy - Attacker advantage
	var _dmg_dealt = GetFinalDamage(attacker, reciver, base_dmg, def, 0,ATTACK_TYPE.DOT);
	
	
	reciver.hp -= _dmg_dealt;
	
	CreateDmgIndicator(string(_dmg_dealt) + "P", reciver.x, reciver.y, ELEMENT.VENOM);
	
	// reduce stacks
	duration = max_duration;
	stack--;
	show_debug_message("DOT - " + string(stack));
	ongoing = false;
}