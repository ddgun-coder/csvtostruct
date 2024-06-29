/// @description Insert description here
// You can write your code in this editor
if (flashing) {
	draw_self();
	gpu_set_fog(true, c_white, 0, 1000);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, flash_alpha);
	gpu_set_fog(false, c_white,0,1000);
	draw_set_alpha(1);
}
else {
	draw_self();	
}