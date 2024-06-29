/// @description Insert description here
// You can write your code in this editor
image_alpha += 1 / 15;
if (abs(image_xscale) < 1) {
	if (image_xscale < 0) {
		image_xscale -= 0.1;
	}
	else {
		image_xscale += 0.1;
	}
	image_yscale += 0.1;
}
if (obj_me.image_xscale * image_xscale < 0) {
	image_xscale *= -1;
}

x = obj_me.x;
y = obj_me.y;