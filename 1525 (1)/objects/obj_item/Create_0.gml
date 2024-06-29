/// @description Insert description here
// You can write your code in this editor
item = global.apple;
sprite_index = item.sprite;
type = item.type;
list_num = -1;

function item_effect(item) {
	switch(item) {
		case global.apple :
	
		break;
		case global.ring1 :
	
		break;	
		default :
			show_debug_message("{0}은 아직 아이템 효과가 없습니다!", item.name);
		break;
	}		
}
function sets_effect(item) {
	if (item.sets == -1 or global.sets_array_get[item.sets]) return;
	
	if (global.sets_array[item.sets] >= global.sets_array_limit[item.sets]) {
		switch(item) {
			case 0 :
			
				break;
			case 1 :
			
				break;
			case 2 :
			
				break;
			default : 
				show_debug_message("{0}세트는 아직 효과가 없습니다!", item.sets);
				break;
		}
		global.sets_array_get[item.sets] = true;
	}
}
function valid_combi(combi) {
	for (var i = 0; i < array_length(combi) - 1; i++) {
		if (ds_list_find_index(global.my_item, combi[i]) == -1) {
			return false;
		}
	}
	return true;
}

function item_get(item) {
	ds_list_add(global.my_item, item);

	var combi;
	for (var i = 0; i < array_length(item.combination); i++) {
		combi = global.item_combinations[| item.combination[i]];
		if (valid_combi(combi)) {
			for (var j = 0; j < array_length(combi) - 1; j++) {
				ds_list_delete(global.my_item, ds_list_find_index(global.my_item, combi[j]));
			}
			item_get(combi[array_length(combi) - 1]);
			break;
		}
	}
}

item_get(global.apple);
item_get(global.keyboard);

var num = ds_list_size(global.my_item);
for (var i = 0; i < num; i++) {
	show_debug_message(global.my_item[| i]);		
}