/// @description Insert description here
// You can write your code in this editor
time++;
if (time >= 60) {
	time -= 60;
	second++;
	if (second >= 60) {
		second -= 60;
		minute++;
	}
}