/// @description Insert description here
// You can write your code in this editor
item = noone;

number = 0;
time = 0;

timer_control = function() {
	idd = collision_point(mouse_x, mouse_y, obj_item_cell, true, false);
	if (idd != noone and !item_blank(idd.number)) {
		if (number != idd.number) {
			number = idd.number;
			time = 0;
		}
		else {
			time++;
		}
	}
	else {
		time = 0;
	}
}

visible_control = function() {
	if (time > 120) {
		obj_item_info_sub.visible = true;
		visible = true;
		item = global.items[idd.number];	
	}
	else {
		item = noone;
		obj_item_info_sub.visible = false;
		visible = false;	
	}
}