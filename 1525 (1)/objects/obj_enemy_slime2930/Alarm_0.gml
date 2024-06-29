/// @description Insert description here
// You can write your code in this editor
var found = mp_grid_path(grid, path, x, y, obj_me.x, obj_me.y, false);
if (found == false) {
	path_end();
}
else {
	path_start(path, 2, path_action_continue, true);
}
alarm[0] = 30;