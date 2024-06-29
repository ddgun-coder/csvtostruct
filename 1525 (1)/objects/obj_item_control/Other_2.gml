/// @description Insert description here
// You can write your code in this editor
var length = LENGTH;
var width = WIDTH;
var dx = 5;
var dy = 5;

for (var i = 0; i < width; i++) {
	for (var j = 0; j < length; j++) {
		var idd = instance_create_depth(x + i * (64 + dx), y + j * (64 + dy), depth, obj_item_cell);
		idd.number = j * width + i;
	}	
}

instance_deactivate_object(obj_equip_ui);
instance_deactivate_object(obj_equip_ui_sub);