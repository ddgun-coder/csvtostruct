/// @description Insert description here
// You can write your code in this editor
if (part_system_exists(ps)) {
	part_system_drawit(ps);
}
if (instance_exists(obj_me)) {
	my_exp = obj_me.my_exp;		
	my_exp_max = obj_me.my_exp_max;
}
draw_sprite(spr_exp_bar, 0, 0, 0);
draw_sprite_part_ext(spr_exp_bar, 1, 0, 0, sprite_get_width(spr_exp_bar) * (my_exp / my_exp_max), sprite_get_height(spr_exp_bar), 0, 0, 1, 1, c_maroon, 1);

for (var i = 0; i < MAX_ITEM_SIZE; i++) {
	draw_sprite(spr_levelUp_small, 0, 64 * i, 64);
	if (global.my_item[i] != noone) {
		draw_sprite(global.my_item[i].spr_index, 0, 64 * i + sprite_get_xoffset(global.my_item[i].spr_index), 64 + sprite_get_yoffset(global.my_item[i].spr_index));
	}
}