/// @description Insert description here
// You can write your code in this editor
if (active) {
	var angle = point_direction(x, y, obj_me.x, obj_me.y);
	x += lengthdir_x(move_speed, angle);
	y += lengthdir_y(move_speed, angle);

	move_speed += 0.5;
}