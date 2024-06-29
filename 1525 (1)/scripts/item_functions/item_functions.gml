#macro LENGTH 4
#macro WIDTH 5

global.money = 50000;
global.items = array_create(LENGTH * WIDTH, noone);
 
enum ITEMTYPE {
	ITEM = -1,
	RING,
	SHOE,
	CLOTH,
	PANT,
	EYE
}

function item_list_delete(list, type) {
	var num = ds_list_size(list);
	var index;
	var sub = 0;
	for (var i = 0; i < num; i++) {
		index = i - sub;
		if (list[| index] == item) {
			sub++;
			array_push(index_array, index);
		}
	}
}

function item_void() constructor {
	combination = [];
}

function item_info(_name, _spr, _price, _type, _item_id = 0) constructor {
	name = _name;
	sprite = _spr;
	price = _price;
	type = _type;
	item_id = _item_id;
}

global.test_item = new item_info("0", 0, 0, 0);
/*
global.item_array = [];
global.item_array_val = [];
*/

global.item_listA = ds_list_create();
global.item_listB = ds_list_create();
global.item_listC = ds_list_create();
global.item_array = [global.item_listA, global.item_listB, global.item_listC];
global.item_combinations = ds_list_create();
global.my_item = ds_list_create();

global.sets_array = array_create(3, 0);
global.sets_array_limit = [2, 4, 3];
global.sets_array_get = array_create(3, false);

/*
global.apple = new item_info("apple, banana", spr_apple, 5000);
global.keyboard = new item_info("keyboard", spr_keyboard, 2000);
global.boom = new item_info("boom", spr_boom, 1500);
global.ring1 = new item_info("low_RING", spr_ring1, 5520, ITEMTYPE.RING);
global.ring2 = new item_info("mid_RING", spr_ring2, 51520, ITEMTYPE.RING);

global.item_array = ["apple", "keyboard", "boom", "ring1", "ring2"];
*/

///@function item_add(item) 
///@param {struct}				item 넣고싶은 아이템 구조체
///@description					아이템을 추가합니다.
//
///

function file_write_with_dqm(_file, _string) {
	file_text_write_string(_file, "\"" + string(_string) + "\"");
}

function csv_to_item(_path) {
	show_debug_message("path is...");
	show_debug_message(working_directory + "datas\\my_data.csv");
	csv = load_csv(working_directory + "datas\\my_data.csv");
	
	var w = ds_grid_width(csv);
	var h = ds_grid_height(csv);
	var names = [];
	
	for (var i = 0; i < w; i++) {
		array_push(names, csv[# i, 0]);
	}
	
	var item_struct, name, struct, val, item_type, divided_array, divided_num;
	for (var i = 1; i < h; i++ ) {
		struct = new item_void();
		for (var j = 0; j < w; j++) {
			name = names[j];
			switch(name) {
				case "sprite":
					val = asset_get_index(csv[# j, i]);
					break;
				case "type" :
					item_type = csv[# j, i];
					divided_array = string_split(item_type, ".");
					divided_num = array_length(divided_array);
					val = item_type;
					break;
				default : 
					val = string_hash_to_newline(csv[# j, i]);
					break;
			}
			struct[$ name] = val;
		}
		variable_global_set(csv[# 0, i], struct);
		/*
		for (var j = 0; j < divided_num; j++) {
			var type_num = real(divided_array[j]);
			ds_list_add(global.item_array[type_num], struct);
		}
		*/
	}
	
	ds_grid_destroy(csv);
}

function set_item_combi(_path) {
	csv = load_csv(_path);
	
	var w = ds_grid_width(csv);
	var h = ds_grid_height(csv);
	var temp_array, index;
	var sub_index = [];
	var num;
	
	for (var i = 1; i < h; i++) {
		temp_array = array_create(0, 0);
		for (var j = 0; j < w; j++) {
			if (csv[# j, i] != "") {
				index = variable_global_get(csv[# j, i]);
				array_push(temp_array, index);
			}
		}
		ds_list_add(global.item_combinations, temp_array);
		
		array_copy(sub_index, 0, temp_array, 0, array_length(temp_array) - 1);
		num = array_length(sub_index);
		for (var j = 0; j < num; j++) {
			array_push(sub_index[j].combination, i - 1);
		}
	}
	
	ds_grid_destroy(csv);
}

csv_to_item(working_directory + "datas\\my_data.csv");
set_item_combi(working_directory + "datas\\combination_table.csv");

function show_item_list() {
	show_debug_message("*show item lists*");
	var num = array_length(global.item_array);
	var sub_num, list_id;
	for (var i = 0; i < num; i++) {
		list_id = global.item_array[i];
		sub_num = ds_list_size(list_id);
		show_debug_message("array[{0}] is...", i);
		for (var j = 0; j < sub_num; j++) {
			show_debug_message(list_id[| j]);
		}
		show_debug_message("end");
	}
	show_debug_message("*end*");
}
show_item_list()
function get_decimal_point_d(val) {
	val = val - floor(val);
	if (val == 0) return 0;
	
	var num = 0;
	while(val != floor(val)) {
		val *= 10;
		num++;
	}
	return num;
}

function get_decimal_point(val) {
	var decimal_limit = 5;
	var string_val = string_format(val, 0, decimal_limit);
	var num = string_length(string_val);
	var i;
	
	if (string_char_at(string_val, num) != "0") {
		return decimal_limit;
	}
	else {
		for (i = num - 1; i > 0; i--) {
			if (string_char_at(string_val, i) != "0") {
				break;
			}
		}
	}

	if (string_char_at(string_val, i) == ".") {
		return 0;
	}
	else {
		string_val = string_copy(string_val, 0, i);
		return string_length(string_val) - string_pos(".", string_val);
	}
}
show_debug_message(get_decimal_point(0.00121));
var temp = 0;
var val = 0;
var val_safe = 0;
var num = 0;
repeat(100) {
	temp += 0.0001;
	val = get_decimal_point_d(temp);
	val_safe = get_decimal_point(temp);
	if (val != val_safe) num++;
}
show_debug_message(num);


function item_create(_x, _y, _type) {
	var list = global.item_array[_type]
	var num = irandom(ds_list_size(list) - 1);
	var rand_item = list[| num];
	var sq = power(10, get_decimal_point(rand_item.re));
	
	if (rand_item.re != 0) {
		var rand = irandom(100 * sq - 1);
		if (!rand_item.re * sq > rand) {
			item_create(_x, _y, _type);
			return;
		}
	}
	
	if (rand_item.is_passive) {
		ds_list_delete(list, num);	
	}

	var idd = instance_create_depth(_x, _y, 0, obj_item);
	with(idd) {
		item = rand_item;
		list_num = num;
		type = _type;
	}
}

function item_to_csv(path) {
	var txt = file_text_open_write(path);

	var names = variable_struct_get_names(global.test_item);
	var num = array_length(names);
	
	file_write_with_dqm(txt, "con_name");
	file_text_write_string(txt, ",");
	for (var i = 0; i < num - 1; i++) {
		file_write_with_dqm(txt, names[i]);
		file_text_write_string(txt, ",");
	}
	file_write_with_dqm(txt, names[num - 1]);
	file_text_writeln(txt);
	
	array_num = array_length(global.item_array);
	var item_struct, name;
	for (var i = 0; i < array_num; i++) {
		item_struct = variable_global_get(global.item_array[i]);
		file_write_with_dqm(txt, global.item_array[i]);
		file_text_write_string(txt, ",");
		show_debug_message(item_struct);
		for (var j = 0; j < num - 1; j++) {
			switch(names[j]) {
				case "sprite":
					show_debug_message("is_sprite");
					file_write_with_dqm(txt, sprite_get_name(item_struct[$ names[j]]));
					file_text_write_string(txt, ",");
					break;
				default : 
					file_write_with_dqm(txt, item_struct[$ names[j]]);
					file_text_write_string(txt, ",");
					break;
			}
		}
		switch(names[num - 1]) {
			case "sprite":
				show_debug_message("is_sprite");
				file_write_with_dqm(txt, sprite_get_name(item_struct[$ names[j]]));
				break;
			default : 
				file_write_with_dqm(txt, item_struct[$ names[j]]);
				break;
		}
		file_text_writeln(txt);
	}
	
	file_text_close(txt);
	
	show_debug_message(filename_path("my_data_out.csv"));
}

function item_add(_item) {
	var size = array_length(global.items);
	for (var i = 0; i < size; i++) {
		if (item_blank(i)) {
			global.items[i] = _item;
			break;
		}//해당 위치에 아이템이 없는 경우
	}
}

///@function item_blank(number)
///@param {Real} number		확인할 위치
///@description				number위치에 아이템이 있는지 확인합니다.
//
///
function item_blank(_number) {
	return global.items[_number] == noone;
}

function item_is_full() {
	var size = array_length(global.items);
	for (var i = 0; i < size; i++) {
		if (item_blank(i)) {
			return false;
		}
	}
	return true;
}	

function item_get_index(_item) {
	var size = array_length(global.items);
	for (var i = 0; i < size; i++) {
		if (global.items[i] == _item) {
			return i;
		}
	}
	return noone;
}

function item_delete(_item) {
	var index = item_get_index(_item);
	if (index != noone) {
		global.items[index] = noone;	
	}
}