/// @description Insert description here
// You can write your code in this editor
if (invinc_time > 0) {
	invinc_time--;
	flash_alpha -= 1 / invin_time_default;
	if (invinc_time == 0) {
		flashing = false;	
	}
}

var dir = point_direction(x, y, obj_me.x, obj_me.y);
var dx = lengthdir_x(enemy_speed, dir);
var dy = lengthdir_y(enemy_speed, dir);

move_and_collide(dx, dy, obj_enemy_abs);

if (x > obj_me.x) {
	image_xscale = -1;
}
else {
	image_xscale = 1;
}

if (place_meeting(x, y, obj_enemy_abs)) {
	for (var i = 0; i < 64; i += 2) {
		if !(place_meeting(x, y + i, obj_enemy_abs)) {
			y = y + i;
			break;
		}
	}
}