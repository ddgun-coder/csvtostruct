/// @description Insert description here
// You can write your code in this editor
item_effect(item);

if (!rand_item.is_passive) {
	if (ds_list_find_index(global.item_array[type], item) != -1) {
		if (item.sets != -1) global.sets_array[item.sets] += 1;
		ds_list_delete(global.item_array[type], list_num);
	}
}
else {
	if (item.sets != -1) global.sets_array[item.sets] += 1;
}

sets_effect(item);
item_get(item);
instance_destroy();