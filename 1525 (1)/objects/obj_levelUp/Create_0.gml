/// @description Insert description here
// You can write your code in this editor
gml_pragma()

xoffset = 0;
item_index = noone;
spr_index = spr_blank;
item_name = "default_message";
item_desc = "default_descript ABCDE FGHIJK LMNO PQ RS TUV WXYZ";
function reset() {
	visible = true;
	xoffset = 450 - index * 90;		
}