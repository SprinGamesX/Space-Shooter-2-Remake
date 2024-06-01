/// @description
// Rolling

if (keyboard_check_pressed(global.key_confirm)){
	if (view == 0){
		if (selected == 2 and global.emeralds >= 1200){
			tenRoll();
			cooldown = seconds(3.1);
			savePity();
			global.emeralds -= 1200;
			SaveCurrencies();
		}
		if (selected == 1 and global.emeralds >= 120){
			roll();
			cooldown = seconds(3.1);
			savePity();
			global.emeralds -= 120;
			SaveCurrencies();
		}
	}
	if (view > 0 and cooldown <= 0) {
		view = 0;
	}
}
if (cooldown > 0) cooldown--;

if (!instance_exists(animation)) animation = noone;

if (view == 0){
	if (keyboard_check_pressed(global.key_left)){
		currentBanner++;
		if (currentBanner > banners) currentBanner = 1;
		setBanner(currentBanner);
	}
	if (keyboard_check_pressed(global.key_right)){
		currentBanner--;
		if (currentBanner < 1) currentBanner = banners;
		setBanner(currentBanner);
	}
	if (keyboard_check_pressed(global.key_down)){
		selected = 2;
	}
	if (keyboard_check_pressed(global.key_up)){
		selected = 1;
	}
	
}