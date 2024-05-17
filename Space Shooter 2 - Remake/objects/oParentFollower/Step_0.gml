/// @description
if (isFollow) follow();

animation();

if (cd <= 0){
	skill();
	cd = max_cd;
}
else { cd--; }

duration--;
if (duration == 0){
	instance_destroy();
}
if (lifespan > 0) lifespan--;
else instance_destroy();

if (hp <= 0) instance_destroy();