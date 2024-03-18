function draw_3d_shape(vertices, edges, shape_size, rotate_speed) {
    static angle_x = 0;
    static angle_y = 0;
    static angle_z = 0;

    // Rotate the shape
    angle_x += rotate_speed;
    angle_y += rotate_speed;
    angle_z += rotate_speed;

    // Center the shape
    var center_x = room_width / 2;
    var center_y = room_height / 2;

    // Draw the shape
    for (var i = 0; i < array_length(edges); i += 2) {
        var v1_index = edges[i];
        var v2_index = edges[i + 1];
        var v1_x = vertices[v1_index * 3];
        var v1_y = vertices[v1_index * 3 + 1];
        var v1_z = vertices[v1_index * 3 + 2];
        var v2_x = vertices[v2_index * 3];
        var v2_y = vertices[v2_index * 3 + 1];
        var v2_z = vertices[v2_index * 3 + 2];

        // Apply rotation matrices
        var x1 = v1_x * dcos(angle_y) * dcos(angle_z) + v1_y * (dsin(angle_x) * dsin(angle_y) * dcos(angle_z) - dcos(angle_x) * dsin(angle_z)) + v1_z * (dcos(angle_x) * dsin(angle_y) * dcos(angle_z) + dsin(angle_x) * dsin(angle_z));
        var y1 = v1_x * dcos(angle_y) * dsin(angle_z) + v1_y * (dsin(angle_x) * dsin(angle_y) * dsin(angle_z) + dcos(angle_x) * dcos(angle_z)) + v1_z * (dcos(angle_x) * dsin(angle_y) * dsin(angle_z) - dsin(angle_x) * dcos(angle_z));
        var z1 = v1_x * -dsin(angle_y) + v1_y * dsin(angle_x) * dcos(angle_y) + v1_z * dcos(angle_x) * dcos(angle_y);

        var x2 = v2_x * dcos(angle_y) * dcos(angle_z) + v2_y * (dsin(angle_x) * dsin(angle_y) * dcos(angle_z) - dcos(angle_x) * dsin(angle_z)) + v2_z * (dcos(angle_x) * dsin(angle_y) * dcos(angle_z) + dsin(angle_x) * dsin(angle_z));
        var y2 = v2_x * dcos(angle_y) * dsin(angle_z) + v2_y * (dsin(angle_x) * dsin(angle_y) * dsin(angle_z) + dcos(angle_x) * dcos(angle_z)) + v2_z * (dcos(angle_x) * dsin(angle_y) * dsin(angle_z) - dsin(angle_x) * dcos(angle_z));
        var z2 = v2_x * -dsin(angle_y) + v2_y * dsin(angle_x) * dcos(angle_y) + v2_z * dcos(angle_x) * dcos(angle_y);

        // Draw the edge
        draw_line(center_x + x1 * shape_size, center_y + y1 * shape_size, center_x + x2 * shape_size, center_y + y2 * shape_size);
    }

    // Check if the shape is clicked
    if (mouse_check_button_pressed(mb_left)) {
        var mx = device_mouse_x_to_gui(0);
        var my = device_mouse_y_to_gui(0);

        // Check if the mouse is inside the shape
        // (Assuming the shape is centered at (center_x, center_y))
        // You may need to adjust this based on your shape's bounding box
        if (mx >= center_x - shape_size && mx <= center_x + shape_size
            && my >= center_y - shape_size && my <= center_y + shape_size) {
            show_message("Shape clicked!");
        }
    }
}

