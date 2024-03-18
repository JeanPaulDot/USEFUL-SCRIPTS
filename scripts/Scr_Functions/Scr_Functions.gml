
function draw_3d_cube(CUBE_SIZE,ROTATE_SPEED) {

       static vertices = [
        -CUBE_SIZE/2, -CUBE_SIZE/2, -CUBE_SIZE/2, // 0
        CUBE_SIZE/2, -CUBE_SIZE/2, -CUBE_SIZE/2,  // 1
        CUBE_SIZE/2, CUBE_SIZE/2, -CUBE_SIZE/2,   // 2
        -CUBE_SIZE/2, CUBE_SIZE/2, -CUBE_SIZE/2,  // 3
        -CUBE_SIZE/2, -CUBE_SIZE/2, CUBE_SIZE/2,  // 4
        CUBE_SIZE/2, -CUBE_SIZE/2, CUBE_SIZE/2,   // 5
        CUBE_SIZE/2, CUBE_SIZE/2, CUBE_SIZE/2,    // 6
        -CUBE_SIZE/2, CUBE_SIZE/2, CUBE_SIZE/2    // 7
    ];

    static edges = [
        0, 1, 1, 2, 2, 3, 3, 0, // Front face
        4, 5, 5, 6, 6, 7, 7, 4, // Back face
        0, 4, 1, 5, 2, 6, 3, 7  // Side edges
    ];

    static angle_x = 0;
    static angle_y = 0;
    static angle_z = 0;

    // Rotate the cube
    angle_x += ROTATE_SPEED;
    angle_y += ROTATE_SPEED;
    angle_z += ROTATE_SPEED;

    // Center the cube
    var center_x = room_width / 2;
    var center_y = room_height / 2;

    // Draw the cube
    for (var i = 0; i < array_length(edges); i += 2) {
        var v1_x = vertices[edges[i] * 3];
        var v1_y = vertices[edges[i] * 3 + 1];
        var v1_z = vertices[edges[i] * 3 + 2];
        var v2_x = vertices[edges[i + 1] * 3];
        var v2_y = vertices[edges[i + 1] * 3 + 1];
        var v2_z = vertices[edges[i + 1] * 3 + 2];

        // Apply rotation matrices
        var x1 = v1_x * dcos(angle_y) * dcos(angle_z) + v1_y * (dsin(angle_x) * dsin(angle_y) * dcos(angle_z) - dcos(angle_x) * dsin(angle_z)) + v1_z * (dcos(angle_x) * dsin(angle_y) * dcos(angle_z) + dsin(angle_x) * dsin(angle_z));
        var y1 = v1_x * dcos(angle_y) * dsin(angle_z) + v1_y * (dsin(angle_x) * dsin(angle_y) * dsin(angle_z) + dcos(angle_x) * dcos(angle_z)) + v1_z * (dcos(angle_x) * dsin(angle_y) * dsin(angle_z) - dsin(angle_x) * dcos(angle_z));
        var z1 = v1_x * -dsin(angle_y) + v1_y * dsin(angle_x) * dcos(angle_y) + v1_z * dcos(angle_x) * dcos(angle_y);

        var x2 = v2_x * dcos(angle_y) * dcos(angle_z) + v2_y * (dsin(angle_x) * dsin(angle_y) * dcos(angle_z) - dcos(angle_x) * dsin(angle_z)) + v2_z * (dcos(angle_x) * dsin(angle_y) * dcos(angle_z) + dsin(angle_x) * dsin(angle_z));
        var y2 = v2_x * dcos(angle_y) * dsin(angle_z) + v2_y * (dsin(angle_x) * dsin(angle_y) * dsin(angle_z) + dcos(angle_x) * dcos(angle_z)) + v2_z * (dcos(angle_x) * dsin(angle_y) * dsin(angle_z) - dsin(angle_x) * dcos(angle_z));
        var z2 = v2_x * -dsin(angle_y) + v2_y * dsin(angle_x) * dcos(angle_y) + v2_z * dcos(angle_x) * dcos(angle_y);

        // Draw the edge
        draw_line(center_x + x1, center_y + y1, center_x + x2, center_y + y2);
    }

    // Check if the cube is clicked
    if (mouse_check_button_pressed(mb_left)) {
        var mx = device_mouse_x_to_gui(0);
        var my = device_mouse_y_to_gui(0);

        // Check if the mouse is inside the cube
        if (mx >= center_x - CUBE_SIZE/2 && mx <= center_x + CUBE_SIZE/2
            && my >= center_y - CUBE_SIZE/2 && my <= center_y + CUBE_SIZE/2) {
            show_message("Cube clicked!");
        }
    }
}

function draw_3d_dodecahedron(DODECAHEDRON_RADIUS, ROTATE_SPEED) {
    
	#macro PHI (1 + sqrt(5)) / 2
#macro INVERSE_PHI 1 / PHI
	
	static vertices = [
        DODECAHEDRON_RADIUS, DODECAHEDRON_RADIUS, DODECAHEDRON_RADIUS,
        DODECAHEDRON_RADIUS, DODECAHEDRON_RADIUS, -DODECAHEDRON_RADIUS,
        DODECAHEDRON_RADIUS, -DODECAHEDRON_RADIUS, DODECAHEDRON_RADIUS,
        DODECAHEDRON_RADIUS, -DODECAHEDRON_RADIUS, -DODECAHEDRON_RADIUS,
        DODECAHEDRON_RADIUS * INVERSE_PHI, DODECAHEDRON_RADIUS * PHI, 0,
        DODECAHEDRON_RADIUS * INVERSE_PHI, -DODECAHEDRON_RADIUS * PHI, 0,
        -DODECAHEDRON_RADIUS * INVERSE_PHI, DODECAHEDRON_RADIUS * PHI, 0,
        -DODECAHEDRON_RADIUS * INVERSE_PHI, -DODECAHEDRON_RADIUS * PHI, 0,
        0, DODECAHEDRON_RADIUS, DODECAHEDRON_RADIUS * INVERSE_PHI,
        0, DODECAHEDRON_RADIUS, -DODECAHEDRON_RADIUS * INVERSE_PHI,
        0, -DODECAHEDRON_RADIUS, DODECAHEDRON_RADIUS * INVERSE_PHI,
        0, -DODECAHEDRON_RADIUS, -DODECAHEDRON_RADIUS * INVERSE_PHI
    ];

    static faces = [
        0, 8, 4, 9, 5,
        0, 5, 10, 6, 1,
        1, 6, 7, 11, 3,
        3, 11, 2, 9, 4,
        2, 8, 0, 10, 7
    ];

    static angle_x = 0;
    static angle_y = 0;
    static angle_z = 0;

    // Rotate the dodecahedron
    angle_x += ROTATE_SPEED;
    angle_y += ROTATE_SPEED;
    angle_z += ROTATE_SPEED;

    // Center the dodecahedron
    var center_x = room_width / 2;
    var center_y = room_height / 2;

    // Draw the dodecahedron
    for (var i = 0; i < array_length(faces); i += 5) {
        var v1_x = vertices[faces[i] * 3];
        var v1_y = vertices[faces[i] * 3 + 1];
        var v1_z = vertices[faces[i] * 3 + 2];
        var v2_x = vertices[faces[i + 1] * 3];
        var v2_y = vertices[faces[i + 1] * 3 + 1];
        var v2_z = vertices[faces[i + 1] * 3 + 2];
        var v3_x = vertices[faces[i + 2] * 3];
        var v3_y = vertices[faces[i + 2] * 3 + 1];
        var v3_z = vertices[faces[i + 2] * 3 + 2];
        var v4_x = vertices[faces[i + 3] * 3];
        var v4_y = vertices[faces[i + 3] * 3 + 1];
        var v4_z = vertices[faces[i + 3] * 3 + 2];
        var v5_x = vertices[faces[i + 4] * 3];
        var v5_y = vertices[faces[i + 4] * 3 + 1];
        var v5_z = vertices[faces[i + 4] * 3 + 2];

        // Apply rotation matrices
        var x1 = v1_x * dcos(angle_y) * dcos(angle_z) + v1_y * (dsin(angle_x) * dsin(angle_y) * dcos(angle_z) - dcos(angle_x) * dsin(angle_z)) + v1_z * (dcos(angle_x) * dsin(angle_y) * dcos(angle_z) + dsin(angle_x) * dsin(angle_z));
        var y1 = v1_x * dcos(angle_y) * dsin(angle_z) + v1_y * (dsin(angle_x) * dsin(angle_y) * dsin(angle_z) + dcos(angle_x) * dcos(angle_z)) + v1_z * (dcos(angle_x) * dsin(angle_y) * dsin(angle_z) - dsin(angle_x) * dcos(angle_z));
        var z1 = v1_x * -dsin(angle_y) + v1_y * dsin(angle_x) * dcos(angle_y) + v1_z * dcos(angle_x) * dcos(angle_y);

        var x2 = v2_x * dcos(angle_y) * dcos(angle_z) + v2_y * (dsin(angle_x) * dsin(angle_y) * dcos(angle_z) - dcos(angle_x) * dsin(angle_z)) + v2_z * (dcos(angle_x) * dsin(angle_y) * dcos(angle_z) + dsin(angle_x) * dsin(angle_z));
        var y2 = v2_x * dcos(angle_y) * dsin(angle_z) + v2_y * (dsin(angle_x) * dsin(angle_y) * dsin(angle_z) + dcos(angle_x) * dcos(angle_z)) + v2_z * (dcos(angle_x) * dsin(angle_y) * dsin(angle_z) - dsin(angle_x) * dcos(angle_z));
        var z2 = v2_x * -dsin(angle_y) + v2_y * dsin(angle_x) * dcos(angle_y) + v2_z * dcos(angle_x) * dcos(angle_y);

        var x3 = v3_x * dcos(angle_y) * dcos(angle_z) + v3_y * (dsin(angle_x) * dsin(angle_y) * dcos(angle_z) - dcos(angle_x) * dsin(angle_z)) + v3_z * (dcos(angle_x) * dsin(angle_y) * dcos(angle_z) + dsin(angle_x) * dsin(angle_z));
        var y3 = v3_x * dcos(angle_y) * dsin(angle_z) + v3_y * (dsin(angle_x) * dsin(angle_y) * dsin(angle_z) + dcos(angle_x) * dcos(angle_z)) + v3_z * (dcos(angle_x) * dsin(angle_y) * dsin(angle_z) - dsin(angle_x) * dcos(angle_z));
        var z3 = v3_x * -dsin(angle_y) + v3_y * dsin(angle_x) * dcos(angle_y) + v3_z * dcos(angle_x) * dcos(angle_y);

		var x4 = v4_x * dcos(angle_y) * dcos(angle_z) + v4_y * (dsin(angle_x) * dsin(angle_y) * dcos(angle_z) - dcos(angle_x) * dsin(angle_z)) + v4_z * (dcos(angle_x) * dsin(angle_y) * dcos(angle_z) + dsin(angle_x) * dsin(angle_z));
        var y4 = v4_x * dcos(angle_y) * dsin(angle_z) + v4_y * (dsin(angle_x) * dsin(angle_y) * dsin(angle_z) + dcos(angle_x) * dcos(angle_z)) + v4_z * (dcos(angle_x) * dsin(angle_y) * dsin(angle_z) - dsin(angle_x) * dcos(angle_z));
        var z4 = v4_x * -dsin(angle_y) + v4_y * dsin(angle_x) * dcos(angle_y) + v4_z * dcos(angle_x) * dcos(angle_y);

        var x5 = v5_x * dcos(angle_y) * dcos(angle_z) + v5_y * (dsin(angle_x) * dsin(angle_y) * dcos(angle_z) - dcos(angle_x) * dsin(angle_z)) + v5_z * (dcos(angle_x) * dsin(angle_y) * dcos(angle_z) + dsin(angle_x) * dsin(angle_z));
        var y5 = v5_x * dcos(angle_y) * dsin(angle_z) + v5_y * (dsin(angle_x) * dsin(angle_y) * dsin(angle_z) + dcos(angle_x) * dcos(angle_z)) + v5_z * (dcos(angle_x) * dsin(angle_y) * dsin(angle_z) - dsin(angle_x) * dcos(angle_z));
        var z5 = v5_x * -dsin(angle_y) + v5_y * dsin(angle_x) * dcos(angle_y) + v5_z * dcos(angle_x) * dcos(angle_y);

        draw_line_width_color(
            center_x + x1, center_y + y1, center_x + x2, center_y + y2, 2, c_white, c_white
        );
        draw_line_width_color(
            center_x + x2, center_y + y2, center_x + x3, center_y + y3, 2, c_white, c_white
        );
        draw_line_width_color(
            center_x + x3, center_y + y3, center_x + x4, center_y + y4, 2, c_white, c_white
        );
        draw_line_width_color(
            center_x + x4, center_y + y4, center_x + x5, center_y + y5, 2, c_white, c_white
        );
        draw_line_width_color(
            center_x + x5, center_y + y5, center_x + x1, center_y + y1, 2, c_white, c_white
        );
    }

    if (mouse_check_button_pressed(mb_left)) {
        var mx = device_mouse_x_to_gui(0);
        var my = device_mouse_y_to_gui(0);

        // Check if the mouse is inside the dodecahedron
        if (mx >= center_x - DODECAHEDRON_RADIUS && mx <= center_x + DODECAHEDRON_RADIUS
            && my >= center_y - DODECAHEDRON_RADIUS && my <= center_y + DODECAHEDRON_RADIUS) {
            show_message("Dodecahedron clicked!");
        }
    }
}
	
	
/// @func draw_3d_shape(vertices, edges, shape_size, rotate_speed)
/// @desc Draws a 3D shape based on the provided vertices and edges.
/// @arg vertices {array} An array of vertex coordinates in the format [x1, y1, z1, x2, y2, z2, ...].
/// @arg edges {array} An array of edge indices, where each pair of indices represents an edge connecting two vertices.
/// @arg shape_size {real} The size of the shape.
/// @arg rotate_speed {real} The rotation speed of the shape.
function draw_3d_shape(vertices, edges, shape_size, rotate_speed) {
    var num_vertices = array_length(vertices) div 3; // Assuming each vertex has 3 components
    var num_edges = array_length(edges) div 2; // Assuming each edge is represented by 2 indices

    var rotation_angle = rotate_speed * current_time;

    for (var i = 0; i < num_edges; i++) {
        var v1_index = edges[i * 2];
        var v2_index = edges[i * 2 + 1];

        // Check if the indices are within the valid range
        if (v1_index >= 0 && v1_index < num_vertices && v2_index >= 0 && v2_index < num_vertices) {
            var v1_x = vertices[v1_index * 3];
            var v1_y = vertices[v1_index * 3 + 1];
            var v1_z = vertices[v1_index * 3 + 2];

            var v2_x = vertices[v2_index * 3];
            var v2_y = vertices[v2_index * 3 + 1];
            var v2_z = vertices[v2_index * 3 + 2];

            // Rotate the vertices around the Z-axis
            var cos_angle = cos(rotation_angle);
            var sin_angle = sin(rotation_angle);
            var v1_x_rotated = v1_x * cos_angle - v1_y * sin_angle;
            var v1_y_rotated = v1_x * sin_angle + v1_y * cos_angle;
            var v2_x_rotated = v2_x * cos_angle - v2_y * sin_angle;
            var v2_y_rotated = v2_x * sin_angle + v2_y * cos_angle;

            // Draw the line
            d3d_primitive_begin(pr_linelist);
            d3d_vertex(v1_x_rotated * shape_size, v1_y_rotated * shape_size, v1_z * shape_size);
            d3d_vertex(v2_x_rotated * shape_size, v2_y_rotated * shape_size, v2_z * shape_size);
            d3d_primitive_end();

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

