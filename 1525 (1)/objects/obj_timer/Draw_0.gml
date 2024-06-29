/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black);
draw_set_font(font_default);
draw_text_bold(x + camera_get_view_x(view_camera[0]), y + camera_get_view_y(view_camera[0]) , $"{minute} : {second} : {floor(time * 50 / 3)}", c_black, c_red);