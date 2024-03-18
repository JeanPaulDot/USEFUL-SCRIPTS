/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

/// @description Change shape based on keyboard input
if (keyboard_check_pressed(vk_right)) {
    shape = (shape + 1) % array_length(all_shapes);
}
if (keyboard_check_pressed(vk_left)) {
    shape = (shape - 1 + array_length(all_shapes)) % array_length(all_shapes);
}
if (keyboard_check_pressed(vk_space)){
	rotate_speed +=1;
}
if (keyboard_check_pressed(vk_shift)){
	rotate_speed -=1;
}

if (keyboard_check_pressed(vk_up)){
	shape_size +=25;
}
if (keyboard_check_pressed(vk_down)){
	shape_size -=25;
}