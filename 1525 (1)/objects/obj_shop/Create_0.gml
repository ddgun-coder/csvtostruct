/// @description Insert description here
// You can write your code in this editor
#macro MAX_HEIGHT 4
height = 0;
shop_array = [];
price_array = [];

function item_list_draw(i, draw_y) {
	draw_sprite(spr_shop_ui_sub, 0, x, draw_y);
	draw_sprite(shop_array[i].sprite, 0, x, draw_y);
	draw_text(x + 65, draw_y, string("name : {0} price : {1}", shop_array[i].name, shop_array[i].price + price_array[i]));	
}

function shop_buy(_number) {
	if (item_is_full()) {
		show_debug_message("아이템창이 가득참");
	}
	else {
		var item = shop_array[_number];
		if (global.money >= item.price + price_array[_number]) {
			global.money -= item.price + price_array[_number];
			item_add(item);
		}
		else {
			show_debug_message("돈이 부족함.");	
		}
	}
}

instance_deactivate_object(id);