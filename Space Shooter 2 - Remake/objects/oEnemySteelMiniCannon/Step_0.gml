/// @description

if (sprite_index != sSteelCannonMini) sprite_index = sSteelCannonMini;

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

if (recoil1 > 0) recoil1 -= 0.1;
if (recoil2 > 0) recoil2 -= 0.1;

var _s = oTeamManager.getActiveShip();
rot = point_direction(x, y, _s.x, _s.y);
image_angle = direction - 180;