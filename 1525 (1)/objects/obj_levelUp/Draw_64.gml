/// @description Insert description here
// You can write your code in this editor
draw_set_font(font_default);
var draw_x = xstart + xoffset;
var draw_y = ystart;
var draw_offset = 10;
draw_set_color(c_black);
draw_sprite(sprite_index, image_index, draw_x, draw_y);
draw_sprite(spr_levelUp_small, 0, draw_x + draw_offset, draw_y + draw_offset);
draw_sprite(spr_index, 0, draw_x + draw_offset + sprite_get_xoffset(spr_index), draw_y + draw_offset + sprite_get_yoffset(spr_index));
draw_set_halign(fa_center);
draw_text(draw_x + sprite_get_width(sprite_index) / 2, draw_y + 15, item_name);
draw_set_halign(fa_left);
draw_text_ext(draw_x + sprite_get_width(spr_levelUp_small) + draw_offset, draw_y + 35, item_desc, 15, sprite_get_width(sprite_index) - sprite_get_width(spr_levelUp_small) - draw_offset);