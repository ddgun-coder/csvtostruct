// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function instance_activate_switch(_obj){
	if (instance_exists(_obj)) {
		instance_deactivate_object(_obj);
	}
	else {
		instance_activate_object(_obj);
	}
}


function item_movement_create(_array, _number) {
	var dx = x - mouse_x;
	var dy = y - mouse_y;
	var inst = instance_create_depth(mouse_x, mouse_y, depth - 1, obj_item_movement);
	inst.sprite_index = _array[_number].sprite;
	inst.image_alpha = 0.6;
	inst.delta_x = dx;
	inst.delta_y = dy;
	inst.number = _number;
	inst.array = _array;
	inst.idd = id;
}