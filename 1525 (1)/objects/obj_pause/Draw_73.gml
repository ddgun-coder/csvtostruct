/// @description Insert description here
// You can write your code in this editor
if (paused == true) {
	if (!sprite_exists(spr_pause)) {
		instance_deactivate_all(true);
		var num = array_length(except_array);
		for (var i = 0; i < num; i++) {
			instance_activate_object(except_array[i]);
		}
		var paused_surf = surface_create(room_width, room_height);
		surface_set_target(paused_surf); 
	    draw_surface(application_surface, 0, 0);
	    surface_reset_target();
		spr_pause = sprite_create_from_surface(paused_surf, 0, 0, room_width, room_height, false, true, 0, 0);
		surface_free(paused_surf);
	}
	else {
		var cx = camera_get_view_x(view_camera[0]);
		var cy = camera_get_view_y(view_camera[0]);
		draw_sprite(spr_pause, 0, cx, cy);
		draw_set_alpha(red_alpha);
		draw_set_color(c_red);
		draw_rectangle(cx, cy, cx + 1366, cy + 768, false);
		draw_set_color(c_white);
		draw_set_alpha(1);
	}
}