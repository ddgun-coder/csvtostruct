/// @description Insert description here
// You can write your code in this editor
if (index == 0) global.angle += 2;

x = obj_me.x + lengthdir_x(80, global.angle + 360 / instance_number(obj_book) * index);
y = obj_me.y + lengthdir_y(80, global.angle + 360 / instance_number(obj_book) * index);