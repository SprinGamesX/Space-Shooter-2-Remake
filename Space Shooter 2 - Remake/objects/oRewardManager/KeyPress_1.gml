/// @description

if (timer <= 0){
	if (global.rewards[0] > 0) {
		global.drives += global.rewards[0];
		global.rewards[0] = 0;
	}
	if (global.rewards[1] > 0) {
		global.scraps += global.rewards[1];
		global.rewards[1] = 0;
	}
	SaveCurrencies();
	oRoomManager.goMain();
}
