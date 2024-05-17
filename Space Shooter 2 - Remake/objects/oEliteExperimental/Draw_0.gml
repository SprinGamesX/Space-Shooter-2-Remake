/// @description

// Inherit the parent event
event_inherited();
draw_setup(font_dmg, c_white)
draw_text_scribble(x, y + 40, "Status: " + string(ds_list_size(statuses)))	
