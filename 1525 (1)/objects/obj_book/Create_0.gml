/// @description Insert description here
// You can write your code in this editor
event_inherited();
var num = instance_number(obj_book);
var i = 0;
for (i = 0; i < num; i++) {
	if (id == instance_find(obj_book, i)) break;
}
index = i;
global.angle = 0;

x = obj_me.x + lengthdir_x(80, global.angle + 360 / instance_number(obj_book) * index);
y = obj_me.y + lengthdir_y(80, global.angle + 360 / instance_number(obj_book) * index);

weapon_damage = 5;
penetrate = true;
alarm[0] = 120;