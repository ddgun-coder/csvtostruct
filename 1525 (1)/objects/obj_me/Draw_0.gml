/// @description Insert description here
// You can write your code in this editor
draw_self();
var spr_index = spr_hp_bar;
var xoffset = sprite_get_width(spr_index) / 2;
var yoffset = 40;
draw_sprite(spr_index, 1, x - xoffset, y + yoffset);
draw_sprite_part(spr_index, 0, 0, 0, sprite_get_width(spr_index) * (hp / m_hp), sprite_get_height(spr_index), x - xoffset, y + yoffset);