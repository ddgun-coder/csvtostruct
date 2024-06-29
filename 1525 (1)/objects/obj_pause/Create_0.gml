/// @description Insert description here
// You can write your code in this editor
paused = false;
spr_pause = -1;
except_array = [obj_GUI_control, obj_UI_abs];
red_alpha = 0;

function pause() {
	paused = !paused;
	if (paused == false) {
	    instance_activate_all();
		sprite_delete(spr_pause);
	}	
}