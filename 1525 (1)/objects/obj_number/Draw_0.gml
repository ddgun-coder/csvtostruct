/// @description Insert description here
// You can write your code in this editor
draw_set_font(global.num_font);
draw_set_alpha(image_alpha);
draw_text_transformed(x, y, damage, image_xscale, image_yscale, 0);
draw_set_alpha(1);
draw_set_font(font_default);