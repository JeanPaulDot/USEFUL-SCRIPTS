/// @description Change shape based on keyboard input
if (keyboard_check_pressed(vk_right)) {
    selected_shape = (selected_shape + 1) % num_shapes;
}
if (keyboard_check_pressed(vk_left)) {
    selected_shape = (selected_shape - 1 + num_shapes) % num_shapes;
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


var prev_mouse_x = 0;
var prev_mouse_y = 0;
var mouse_down = false;

// Update the carousel angle
if (mouse_down) {
    var angle_diff = point_direction(prev_mouse_x, prev_mouse_y, mouse_x, mouse_y) - point_direction(mouse_x, mouse_y, prev_mouse_x, prev_mouse_y);
    carousel_angle += angle_diff;
    selected_shape = floor(clamp(carousel_angle / angle_step, 0, num_shapes - 1));
}

// Draw the carousel
draw_set_color(c_gray);
draw_circle(carousel_x, carousel_y, carousel_radius, true);

// Draw each shape in the carousel
for (var i = 0; i < num_shapes; i++) {
    // Calculate the position of the current shape in the carousel
    var angle = carousel_angle + i * angle_step * pi / 180;
    var shape_x = carousel_x + lengthdir_x(carousel_radius, angle);
    var shape_y = carousel_y + lengthdir_y(carousel_radius, angle);

    // Calculate the distance of the shape from the carousel's center
    var shape_dist = point_distance(carousel_x, carousel_y, shape_x, shape_y);

    // Calculate the scale of the shape based on its distance
    var shape_scale = lerp(0.5, 1, (carousel_radius - shape_dist) / carousel_radius);

    // Draw the shape at the calculated position and scale
    draw_set_color(i == selected_shape ? c_yellow : c_white);
    draw_3d_shape(all_shapes[i][0], all_shapes[i][1], shape_x, shape_y, (shape_size * shape_scale), (shape_size * shape_scale), rotate_speed);
}

// Update the mouse properties
if (mouse_check_button_pressed(mb_left)) {
    prev_mouse_x = mouse_x;
    prev_mouse_y = mouse_y;
    mouse_down = true;
} else if (mouse_check_button_released(mb_left)) {
    mouse_down = false;
}