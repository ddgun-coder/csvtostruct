/// @description Insert description here
// You can write your code in this editor
var xspeed = 0;
var yspeed = 0;
if (keyboard_check(ord("A"))) {
	xspeed -= obj_speed;
	image_xscale = -1;
}
if (keyboard_check(ord("S"))) {
	yspeed += obj_speed;
}
if (keyboard_check(ord("D"))) {
	xspeed += obj_speed;
	image_xscale = 1;
}
if (keyboard_check(ord("W"))) {
	yspeed -= obj_speed;
}
if (keyboard_check(ord("Q"))) {
	hp -= 10;
}
if (xspeed != 0 and yspeed != 0) {
	xspeed /= sqrt(2);
	yspeed /= sqrt(2);
}
x += xspeed;
y += yspeed;

if (xspeed == 0 and yspeed == 0) {
	image_speed = 0;
}
else {
	image_speed = 1;
}
if (image_blend == c_red) {
	image_blend = c_white;
}

if !(xspeed == 0 and yspeed == 0) {
	angle = point_direction(0, 0, xspeed, yspeed);
}
if (mouse_check_button(mb_right)) {
	my_exp += 999;	
}
if (my_exp >= my_exp_max) {
	my_exp -= my_exp_max;
	my_exp_max += 100;
	obj_pause.pause();
	var item_array = get_random_items(4);
	with(obj_levelUp) {
		item_index = item_array[index];
		item_name = item_index.name;
		item_desc = item_index.descript;
		spr_index = item_index.spr_index;
		reset();
	}
	obj_levelUp_big.visible = true;
	obj_GUI_control.part_start();
}

if (hp <= 0 and global.dead == false) {
	global.dead = true;
	obj_pause.pause();
	obj_re.visible = true;
	obj_room_out2.visible = true;
}
