/// @description Insert description here
// You can write your code in this editor
time = 0;
second = 0;
minute = 0;

monster_array = [];

monster_array[0] = [obj_enemy_slime];
monster_array[1] = [obj_enemy_slime, obj_enemy_wolf];
monster_array[2] = [obj_enemy_slime, obj_enemy_bat];
monster_array[3] = [obj_enemy_wolf, obj_enemy_bat];

monster_timer_cooldown = 60;
alarm[0] = 1;

function draw_text_bold(_x, _y, _str, _color1, _color2) {
	draw_set_color(_color1);
	draw_text(_x, _y + 1, _str);
	draw_text(_x + 1, _y, _str);
	draw_text(_x, _y - 1, _str);
	draw_text(_x - 1, _y, _str);
	draw_set_color(_color2);
	draw_text(_x, _y, _str);
}
