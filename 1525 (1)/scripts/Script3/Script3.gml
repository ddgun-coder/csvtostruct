// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro MAX_ITEM_SIZE 6
global.angle = 0;
global.num_font = font_add_sprite_ext(spr_numbers, "0123456789", false, 0);
global.item_list = ds_list_create();
global.my_item = array_create(MAX_ITEM_SIZE, noone);

function obj_weapon_control_create(_weapon, _cooldown) {
	instance_create_depth(0, 0, depth, obj_weapon_control, { 
		cooldown : _cooldown,
		weapon : _weapon
	});
}

function item(_name, _desc, _index_name, _cool_down) constructor {
	name = _name;
	descript = _desc;
	level = 0;
	cool_down = _cool_down;
	var index;
	
	index = asset_get_index("spr_" + _index_name);
	if (index == -1) show_debug_message("spr_" + _index_name + "이 존재하지 않는다.");
	spr_index = index;
	
	index = asset_get_index("obj_" + _index_name);
	if (index == -1) show_debug_message("obj_" + _index_name + "이 존재하지 않는다.");
	obj_index = index;
}

global.axe = new item("axeEX", "도끼다.", "axe", 90);
global.book = new item("qur'an", "책이다.", "book", 180);
global.boomerang = new item("boomerang", "부메랑이다.", "boomerang", 45);
global.laser = new item("loser", "레이저다.", "laser", 120);
global.sward = new item("sward", "검이다.", "sward", 10);
global.whip = new item("whip", "채찍이다.", "whip", 60);

function set_items() {
	ds_list_add(global.item_list, global.axe, global.book, global.boomerang, global.laser, global.sward, global.whip);
	for (var i = 0; i < MAX_ITEM_SIZE; i++) {
		global.my_item[i] = noone;
	}
}
set_items();

function get_random_items(num) {
	var list_num = ds_list_size(global.item_list);
	var result_array = [];
	if (num >= list_num) {
		for (var i = 0; i < list_num; i++) {
			result_array[i] = global.item_list[| i];
		}
		return result_array;
	}
	else {
		ds_list_shuffle(global.item_list);
		for (var i = 0; i < num; i++) {
			result_array[i] = global.item_list[| i];
		}
		return result_array;
	}
}
