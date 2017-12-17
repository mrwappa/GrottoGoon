/// @description Insert description here
// You can write your code in this editor
k_left = keyboard_check(ord("A"));
k_right= keyboard_check(ord("D"));
k_jump  = keyboard_check_pressed(vk_space);
hold_k_jump  = keyboard_check(vk_space);
release_k_jump = keyboard_check_released(vk_space);
k_crouch = keyboard_check(ord("S"));


delta = 60/1000000*delta_time;