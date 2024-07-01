/// @description Insert description here
// You can write your code in this editor
var item = obj_item_info.my_item;
draw_self();
if (item != noone) {
	var image_width = sprite_get_width(sprite_index) * image_xscale;
	var image_height = sprite_get_height(sprite_index) * image_yscale;
	var dx = (image_width - 64) / 2;
	var dy = (image_height - 64) / 2;
	draw_sprite(item.sprite, 0, x + dx, y + dy);
	/*
	var xscale = image_width / 64;
	var yscale = image_height / 64;
	draw_sprite_ext(item.sprite, 0, x, y, xscale, yscale, 0, c_white, 1);
	*/
}
