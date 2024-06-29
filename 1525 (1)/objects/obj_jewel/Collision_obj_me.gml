/// @description Insert description here
// You can write your code in this editor
if (!active) {
	active = true;
	move_speed = -10;
}
else {
	if (move_speed > 0) instance_destroy();	
}