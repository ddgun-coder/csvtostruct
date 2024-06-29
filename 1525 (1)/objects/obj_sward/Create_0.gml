/// @description Insert description here
// You can write your code in this editor
event_inherited();
alarm[0] = 60;
image_angle = obj_me.angle;
var len = random_range(-32, 32);
x += lengthdir_x(len, image_angle - 90);
y += lengthdir_y(len, image_angle - 90);
weapon_damage = 10;