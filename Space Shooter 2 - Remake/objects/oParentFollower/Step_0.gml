/// @description
if (isFollow) follow();

animation();

if (cd <= 0){
	skill();
	cd = cdMax;
}
else { cd--; }


if (lifespan > 0) lifespan--;
else instance_destroy();

if (hp <= 0) instance_destroy();