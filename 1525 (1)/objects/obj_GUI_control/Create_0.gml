/// @description Insert description here
// You can write your code in this editor
my_exp = 0;
my_exp_max = 0;
ps = noone;

function part_start() {
	ps = part_system_create(ParticleSystem1);
	part_system_automatic_draw(ps, false);
	part_system_position(ps, 768, 384);
}

function part_end() {
	part_system_destroy(ps);
}