/// @description Insert description here
// You can write your code in this editor
var other_id = collision_point(mouse_x, mouse_y, all, true, true);

if (other_id != noone) {
	switch(other_id.object_index) {
		case obj_item_cell :
			if (idd.object_index == obj_equip_ui_sub) {
				if (other_id.array[other_id.number] == noone or other_id.array[other_id.number].type == idd.image_index) {
					item_swap(other_id);
				}
			}
			else {
				item_swap(other_id);	
			}
			break;
		case obj_equip_ui_sub :
			if (other_id.image_index == array[number].type) {
				item_swap(other_id);
			}
			break;
	}	
}

instance_destroy(); 