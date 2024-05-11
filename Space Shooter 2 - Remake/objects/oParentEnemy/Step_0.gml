/// @description Insert description here
// You can write your code in this editor
switch(movement){
	case MOVEMENT_PATTERN.LINE:{
		MoveLine(true);
	} break;
	case MOVEMENT_PATTERN.CURVE:{
		MoveCurve(true);
	} break;
	case MOVEMENT_PATTERN.GRAVITATE:{
		MoveGravitate(true);
	} break;
	case MOVEMENT_PATTERN.CIRCLE:{
		MoveCircle(true);
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
