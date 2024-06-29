/// @description Insert description here
// You can write your code in this editor
if (visible == false) exit;
for (var i = 0; i < MAX_ITEM_SIZE; i++) {
	if (global.my_item[i] == noone) {
		global.my_item[i] = item_index;
		break;
	}
}
obj_weapon_control_create(item_index.obj_index, item_index.cool_down);
obj_pause.pause();
with (obj_levelUp) {
	visible = false;
}
obj_levelUp_big.visible = false;
obj_GUI_control.part_end();