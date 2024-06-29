/// @description Insert description here
// You can write your code in this editor
function set_struct() {
	var name = string_replace(object_get_name(object_index), "o_", "");
	var struct = variable_global_get(name);
	if (struct == undefined) {
		show_debug_message($"{name}은 없다.");
		return;
	}
	
	struct_foreach(struct, function(_name, _value) {
		variable_instance_set(id, _name, _value);
	});		
}
set_struct();