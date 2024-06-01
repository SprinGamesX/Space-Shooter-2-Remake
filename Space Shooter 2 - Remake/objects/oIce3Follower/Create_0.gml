/// @description
event_inherited();

animation = function(){
	
	
}
skill = function(){
	var _target = instance_nearest(x, y, oParentEnemy);
	if (instance_exists(_target)){
		direction = point_direction(x, y, _target.x, _target.y); 
		image_angle = direction;
	}
	
	if (owner.passives[0]){
		ApplyShield(oTeamManager.getActiveShip(), owner.getAtk() * 0.01);
	}
	
	if (owner.passives[2]){
		CreateProjectile(oIceShard1, owner, x, y, 15, direction - 5, ATTACK_TYPE.FOLLOWUP, owner.element,,,1);
		CreateProjectile(oIceShard1, owner, x, y, 15, direction + 5, ATTACK_TYPE.FOLLOWUP, owner.element,,,1);
	}
	CreateProjectile(oIceShard1, owner, x, y, 15, direction, ATTACK_TYPE.FOLLOWUP, owner.element,,,2);
}