/// @description
event_inherited();

animation = function(){
	
	
}
skill = function(){
	var _target = instance_nearest(x, y, oParentElite);
	if (instance_exists(_target)){
		direction = point_direction(x, y, _target.x, _target.y); 
		image_angle = direction;
	}
	
	CreateProjectile(oVenomSoundwave, owner, x, y, 12, direction, ATTACK_TYPE.SKILL, owner.element,10);
}