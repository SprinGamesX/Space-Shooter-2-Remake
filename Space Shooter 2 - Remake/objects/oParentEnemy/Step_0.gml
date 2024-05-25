/// @description Insert description here
// You can write your code in this editor
switch(movement){
	case MOVEMENT_PATTERN.LINE:{
		MoveLine(spin);
	} break;
	case MOVEMENT_PATTERN.CURVE:{
		MoveCurve(spin);
	} break;
	case MOVEMENT_PATTERN.GRAVITATE:{
		MoveGravitate(spin);
	} break;
	case MOVEMENT_PATTERN.CIRCLE:{
		MoveCircle(spin);
	} break;
}

var _col = instance_place(x, y, oParentShip);
if (_col != noone){
	_col.onEnemyHit(self);
}

if (hp <= 0) onDeath();
if (!entrance_done){
	onEntrance();
}
if (explosive_immune > 0){
	explosive_immune--;
}
if (!instance_exists(leader)) instance_destroy();

