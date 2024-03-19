/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

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
    var shape_dist = point_distance(carousel_x, carousel_y, shape_x, shape_y)*i;

    // Calculate the scale of the shape based on its distance
    var shape_scale = lerp(0.5, 1, (carousel_radius - shape_dist) / carousel_radius);

    // Draw the shape at the calculated position and scale
    draw_set_color(i == selected_shape ? c_yellow : c_white);
    draw_3d_shape(all_shapes[i][0], all_shapes[i][1], shape_x * (i*0.5), shape_y, (shape_size * shape_scale), (shape_size * shape_scale), rotate_speed*(0.5*i));
}
