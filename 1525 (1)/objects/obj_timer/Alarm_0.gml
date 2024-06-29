/// @description Insert description here
// You can write your code in this editor
var spawn_x, spawn_y;

while(true) {
	spawn_x = irandom(room_width);
	spawn_y = irandom(room_height);
	if (!point_in_rectangle(spawn_x, spawn_y, 
	camera_get_view_x(view_camera[0]), camera_get_view_x(view_camera[0]), camera_get_view_x(view_camera[0]) + 1366, camera_get_view_x(view_camera[0]) + 768)) continue;
	if (place_free(spawn_x, spawn_y)) break;
}

var size = array_length(monster_array[minute]);
var rand = irandom(size - 1);

instance_create_depth(spawn_x, spawn_y, depth, monster_array[minute][rand]);
alarm[0] = monster_timer_cooldown;