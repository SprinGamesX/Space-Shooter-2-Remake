/// @description Insert description here
// You can write your code in this editor
#macro ITEMS_PER_ROW 10
#macro DISPLAY_AMOUNT 90

if (room == rInventory){
	// Drawing inventory UI
	var _xx = 64;
	var _yy = 64;
	for (var i = 0; i < DISPLAY_AMOUNT; i++){
		var xx = _xx +  (i mod ITEMS_PER_ROW) * 72;
		var yy = _yy + (i div ITEMS_PER_ROW) * 72;
		
		draw_sprite(sInventorySlot, selected - (offset*10) == i , xx, yy);
		var _index = i + (offset * 10);
		var _chip = inventory[|_index];
		if (instance_exists(_chip)){
			draw_sprite_ext(sChip, inventory[|_index].stat, xx, yy, 1, 1, 0, ColorForChipRarity(inventory[|_index]), 1);
			if (_chip.ownerId != -1){
				draw_sprite_ext(object_get_sprite(global.ships[_chip.ownerId]), 0, xx, yy - 32, 0.75, 0.75, 0, c_white, 1);
			}
		}
	}
	
	draw_setup();
	draw_text_scribble(room_width -200, 100, "Selected: " + string(selected));
	
	// Drawing chip details
	var _chip = inventory[|selected];
	draw_sprite_stretched(sInventorySlot, 0, room_width - 500, 16, 500, room_height - 32);
		draw_setup(font_chips, c_white);
		draw_text_scribble(room_width - 250, 72, "CHIP DETAILS:")
	if (instance_exists(_chip)){
		draw_text_scribble(room_width - 250, 72*1.5, "[" + string(ColorForChipRarity(_chip)) + "]RARITY: " + GetRarityString(_chip.rarity))
		draw_text_scribble(room_width - 250, 72*2, GetChipStatString(_chip.stat) + " : " + string(_chip.scale * 100) +"%");
		
		draw_text_scribble(room_width - 250, 72*3, "Slot: - " +  string(global.currentShipSlot) + " +");
		draw_sprite_ext(sChip, _chip.stat, room_width - 250, room_height / 2, 3, 3, 0, ColorForChipRarity(_chip), 1);
		// Display the ship that currently has 
		if (_chip.ownerId != -1){
			draw_sprite_ext(object_get_sprite(global.ships[_chip.ownerId]), 0, room_width - 100, room_height/2 - 20, 2, 2, 0, c_white, 1);
			draw_text_scribble(room_width - 100, room_height/2 + 50, "[scale, 0.5]Currently on");
		}
		// Draw current equipped
		if (global.chips[global.currentShip][global.currentShipSlot] != -1){
			_chip = getChip(global.chips[global.currentShip][global.currentShipSlot]);
			draw_text_scribble(room_width - 400, room_height/2 + 50, "[scale, 0.5]Equipped");
			draw_sprite_ext(sChip, _chip.stat, room_width - 400, room_height / 2 - 20, 2, 2, 0, ColorForChipRarity(_chip), 1);
		}
		// Drawing Options
		if (inventory[|selected].uuid == global.chips[global.currentShip][global.currentShipSlot])
			draw_text_scribble(room_width - 250, room_height - 200, inside_selected == 0 ? "[c_aqua][wave]Remove" : "Remove");
		else
			draw_text_scribble(room_width - 250, room_height - 200, inside_selected == 0 ? "[c_aqua][wave]Equip" : "Equip");
		draw_text_scribble(room_width - 250, room_height - 150, inside_selected == 1 ? "[c_aqua][wave]Return" : "Return");
		draw_text_scribble(room_width - 250, room_height - 100, inside_selected == 2 ? "[c_aqua][wave]Delete" : "Delete");
	}
	
	
	
	
}