// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MoveLine(_spin){
	speed = base_spd * (1 + GetBuffByType(self, STAT.SPD));
	direction = dir;
	if (_spin){
		image_angle += 1 * GetBuffByType(self, STAT.SPD);
	}
	KillOutOfBounds(50);
}
function MoveCurve(_spin){
	speed = base_spd * (1 + GetBuffByType(self, STAT.SPD));
	direction = dir;
	dir += curve;
	if (_spin){
		image_angle += 1 * (1 + GetBuffByType(self, STAT.SPD));
	}
	KillOutOfBounds(50);
}

function MoveGravitate(_spin){
	speed = base_spd * (1 + GetBuffByType(self, STAT.SPD));
	base_spd += grav;
	direction = dir;
	if (_spin){
		image_angle += 1 * (1 + GetBuffByType(self, STAT.SPD));
	}
	KillOutOfBounds(50);
}
function MoveCircle(_spin){
	speed = 0;
	direction = dir;
	
	x = base_x + lengthdir_x(radius, direction);
	y = base_y + lengthdir_y(radius, direction);
	
	dir += base_spd * (1 + GetBuffByType(self, STAT.SPD));
	
	if (_spin){
		image_angle += 1 * (1 + GetBuffByType(self, STAT.SPD));
	}
	KillOutOfBounds(50);
}

