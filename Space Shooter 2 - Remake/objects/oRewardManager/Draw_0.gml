/// @description
draw_setup(font_fipps);

draw_text_scribble(room_width/2, room_height/2 - 100, "[scale, 2]Game Finished!");
draw_setup(font_menu_details);
draw_text_scribble(room_width/2, room_height/2 + 100, timer <= 0 ? "Press (Any key) to proceed" : "Wait " + string(timer) + " Seconds...");
draw_text_scribble(room_width/2, room_height/2 + 200, "[sDrive] " + string(global.rewards[0]) + "[sChipScrap] " + string(global.rewards[1]) + "[sEmerald] " + string(global.rewards[2]));