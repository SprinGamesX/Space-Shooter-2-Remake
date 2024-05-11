/// @description

// Inherit the parent event


ds_list_destroy(statuses);

for (var i = 0; i < 360; i+= 20){
	SummonEnemy(oEnemyNormal, x, y, leader.base_hp/20, 100, leader.base_dmg, 2, i, leader, leader.element,,,,,true);
}


if (instance_exists(oEliteIceShards)){
	oEliteIceShards.invis = false;
}

for (var i = 0; i < 360; i+= 20){
	SummonEnemy(oEnemyNormal, x, y, leader.base_hp/20, 100, leader.base_dmg, 2, i, leader, leader.element,,,,,true);
}
