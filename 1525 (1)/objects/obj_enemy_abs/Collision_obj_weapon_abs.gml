/// @description Insert description here
// You can write your code in this editor
if (invinc_time <= 0) {
	invinc_time = invin_time_default;
}
else {
	exit;
}
if (other.penetrate == false) {
	instance_destroy(other);
}
hp -= other.weapon_damage;
if (hp <= 0) {
	var idd = instance_create_depth(x, y, depth, obj_enemy_dead);
	idd.sprite_index = asset_get_index(sprite_get_name(sprite_index) + "_dead");
	idd.image_index = 0;
	idd.image_xscale = image_xscale;
	idd.enemy_exp = enemy_exp;
	instance_destroy();
	exit;
}
var dir = point_direction(x, y, obj_me.x, obj_me.y);
var dx = lengthdir_x(-15 * other.knock_back, dir);
var dy = lengthdir_y(-15 * other.knock_back, dir);
move_and_collide(dx, dy, obj_enemy_abs);
flashing = true;
flash_alpha = 1;
var idd = instance_create_depth(x, y, depth - 1, obj_number);
idd.damage = other.weapon_damage;