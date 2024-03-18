///@desc Drawing carousel and Shapes around it
/*
draw_set_color(c_gray);
draw_circle(carousel_x, carousel_y, carousel_radius, true);

carousel_angle = -(selected_shape * (360 / num_shapes)) * pi / 180;
for (var i = 0; i < num_shapes; i++) {
    var angle = carousel_angle + i * (360 / num_shapes) * pi / 180;
    var shape_x = carousel_x + cos(angle) * carousel_radius;
    var shape_y = carousel_y + sin(angle) * carousel_radius;

    draw_set_color(i == selected_shape ? c_yellow : c_white);
    draw_3d_shape(all_shapes[i][0], all_shapes[i][1], shape_x,shape_y, shape_size, shape_size,rotate_speed);
	
}

carousel_angle += carousel_angle_speed;

*/
