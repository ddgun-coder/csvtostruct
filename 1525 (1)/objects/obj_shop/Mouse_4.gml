/// @description Insert description here
// You can write your code in this editor
var dx = mouse_x - x;
var dy = mouse_y - (y + 50);

var number = floor(dy / 64) + height;
var n = array_length(shop_array);
if (number < n and number >= 0) {
	shop_buy(number);
}