/// @description Insert description here
// You can write your code in this editor
if (global.dead) {
	if (red_alpha < 0.5) {
		red_alpha += 0.005;	
	}
}
if (obj_levelUp.visible or global.dead) exit;
if keyboard_check_pressed(ord("P")) {
	pause();
}