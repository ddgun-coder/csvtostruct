/// @description Insert description here
// You can write your code in this editor
draw_self();
var n = min(array_length(shop_array), MAX_HEIGHT);
for (var i = 0; i < n; i++) {
	var draw_y = y + i * 64 + 50;
	item_list_draw(i + height, draw_y);
}