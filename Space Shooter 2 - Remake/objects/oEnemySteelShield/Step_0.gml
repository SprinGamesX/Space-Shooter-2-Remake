/// @description

if (sprite_index != sSteelCannonShield) sprite_index = sSteelCannonShield;

switch(movement){
	case MOVEMENT_PATTERN.LINE:{
		MoveLine(false);
	} break;
	case MOVEMENT_PATTERN.CURVE:{
		MoveCurve(false);
	} break;
	case MOVEMENT_PATTERN.GRAVITATE:{
		MoveGravitate(false);
	} break;
	case MOVEMENT_PATTERN.CIRCLE:{
		MoveCircle(false);
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

image_angle = direction - 180;