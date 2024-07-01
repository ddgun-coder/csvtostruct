/// @description Insert description here
// You can write your code in this editor
#macro MAX_HEIGHT 4
height = 0;

function item_list_draw(i, draw_y) {
	draw_sprite(spr_shop_ui_sub, 0, x, draw_y);
	draw_sprite(shop_array[i].sprite, 0, x, draw_y);
	draw_text_ext(x + 65, draw_y, string("name : {0} price : {1}", shop_array[i].name, real(shop_array[i].price) + price_array[i]), 15, 300);	
}

function shop_buy(_number) {
	if (item_is_full()) {
		show_debug_message("아이템창이 가득참");
	}
	else {
		var _item = shop_array[_number];
		var _price = real(_item.price);
		if (global.money >= _price + price_array[_number]) {
			global.money -= _price + price_array[_number];
			item_add(_item);
		}
		else {
			show_debug_message("돈이 부족함.");	
		}
	}
}

instance_deactivate_object(id);