
// Helper function to check if a point is inside a polygon
function point_in_polygon(px, py, vertices, scale_x, scale_y, offset_x, offset_y) {
    var num_vertices = array_length(vertices) div 3;
    var intersections = 0;
    var j = num_vertices - 1;

    for (var i = 0; i < num_vertices; i++) {
        var vx1 = vertices[j * 3] * scale_x + offset_x;
        var vy1 = vertices[j * 3 + 1] * scale_y + offset_y;
        var vx2 = vertices[i * 3] * scale_x + offset_x;
        var vy2 = vertices[i * 3 + 1] * scale_y + offset_y;

        if (vy1 == vy2 && py >= min(vy1, vy2) && py <= max(vy1, vy2) && px >= min(vx1, vx2) && px <= max(vx1, vx2)) {
            return true;
        }

        if (py >= min(vy1, vy2) && py <= max(vy1, vy2) && px <= max(vx1, vx2) && intersect(px, py, vx1, vy1, vx2, vy2)) {
            intersections++;
        }

        j = i;
    }

    return (intersections % 2 == 1);
}

// Helper function to check if a point is on the same side of a line
function intersect(px, py, vx1, vy1, vx2, vy2) {
    var dx = vx2 - vx1;
    var dy = vy2 - vy1;
    var det = dx * (py - vy1) - dy * (px - vx1);
    return det > 0;
}



    
function draw_3d_cube(vertices, edges, shape_x, shape_y, shape_size_x, shape_size_y, rotation_speed) {
    static angle_x = 0;
    static angle_y = 0;
    static angle_z = 0;

    // Rotate the shape
    angle_x += rotation_speed;
    angle_y += rotation_speed;
    angle_z += rotation_speed;

    // Center the shape
    var center_x = shape_x;
    var center_y = shape_y;

    // Array to store transformed vertices
    var transformed_vertices = array_create(array_length(vertices));

    // Transform vertices based on rotation
    for (var i = 0; i < array_length(vertices); i += 3) {
        var v_x = vertices[i];
        var v_y = vertices[i + 1];
        var v_z = vertices[i + 2];

        // Apply rotation matrices
        var _x = v_x * dcos(angle_y) * dcos(angle_z) + v_y * (dsin(angle_x) * dsin(angle_y) * dcos(angle_z) - dcos(angle_x) * dsin(angle_z)) + v_z * (dcos(angle_x) * dsin(angle_y) * dcos(angle_z) + dsin(angle_x) * dsin(angle_z));
        var _y = v_x * dcos(angle_y) * dsin(angle_z) + v_y * (dsin(angle_x) * dsin(angle_y) * dsin(angle_z) + dcos(angle_x) * dcos(angle_z)) + v_z * (dcos(angle_x) * dsin(angle_y) * dsin(angle_z) - dsin(angle_x) * dcos(angle_z));
        var _z = v_x * -dsin(angle_y) + v_y * dsin(angle_x) * dcos(angle_y) + v_z * dcos(angle_x) * dcos(angle_y);

        transformed_vertices[i] = _x;
        transformed_vertices[i + 1] = _y;
        transformed_vertices[i + 2] = _z;
    }

    // Draw the shape
    for (var i = 0; i < array_length(edges); i += 2) {
        var v1_index = edges[i];
        var v2_index = edges[i + 1];

        var v1_x = transformed_vertices[v1_index * 3] * shape_size_x + center_x;
        var v1_y = transformed_vertices[v1_index * 3 + 1] * shape_size_y + center_y;

        var v2_x = transformed_vertices[v2_index * 3] * shape_size_x + center_x;
        var v2_y = transformed_vertices[v2_index * 3 + 1] * shape_size_y + center_y;

        draw_line(v1_x, v1_y, v2_x, v2_y);
    }

    // Check if the mouse is within the polygon
    if (point_in_polygon(mouse_x, mouse_y, transformed_vertices, shape_size_x, shape_size_y, center_x, center_y)) {
        if (mouse_check_button_pressed(mb_left)) {
            show_message("Shape clicked!");
        }
    }
}
	
function draw_3d_pyramid(vertices, edges,shape_x,shape_y,shape_size_x,shape_size_y,rotation_speed) {
    
	
	static angle_x = 0;
    static angle_y = 0;
    static angle_z = 0;

    // Rotate the shape
    angle_x += rotation_speed;
    angle_y += rotation_speed;
    angle_z += rotation_speed;

    // Center the shape
    var center_x = shape_x;
    var center_y = shape_y;

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
        draw_line(center_x + x1 * shape_size_x, center_y + y1 * shape_size_y, center_x + x2 * shape_size_x, center_y + y2 * shape_size_y);
    }  
}

function draw_3d_tetra(vertices, edges,shape_x,shape_y,shape_size_x,shape_size_y,rotation_speed) {
    
	
	static angle_x = 0;
    static angle_y = 0;
    static angle_z = 0;

    // Rotate the shape
    angle_x += rotation_speed;
    angle_y += rotation_speed;
    angle_z += rotation_speed;

    // Center the shape
    var center_x = shape_x;
    var center_y = shape_y;

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
        draw_line(center_x + x1 * shape_size_x, center_y + y1 * shape_size_y, center_x + x2 * shape_size_x, center_y + y2 * shape_size_y);
    }  
}

function draw_3d_icosahedron(vertices, edges,shape_x,shape_y,shape_size_x,shape_size_y,rotation_speed) {
    
	
	static angle_x = 0;
    static angle_y = 0;
    static angle_z = 0;

    // Rotate the shape
    angle_x += rotation_speed;
    angle_y += rotation_speed;
    angle_z += rotation_speed;

    // Center the shape
    var center_x = shape_x;
    var center_y = shape_y;

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
        draw_line(center_x + x1 * shape_size_x, center_y + y1 * shape_size_y, center_x + x2 * shape_size_x, center_y + y2 * shape_size_y);
    }  
}

function draw_carousel(items, center_x, center_y, radius, rotation_speed) {
        static rotation_angle = 0;
    static target_rotation_angle = 0;
    static selected_item = noone;
    static tween_factor = 0.2; // Adjust this value to control the smoothness of the rotation

    // Number of items in the carousel
    var num_items = array_length(items);

    // Angle between each item
    var angle_step = 360 / num_items;

    // Handle key input
    if (keyboard_check_pressed(vk_right)) {
        target_rotation_angle -= angle_step;
    } else if (keyboard_check_pressed(vk_left)) {
        target_rotation_angle += angle_step;
    }

    // Wrap the target rotation angle and adjust for 0/360 degree boundary
    if (target_rotation_angle >= 360) {
        target_rotation_angle -= 360;
    } else if (target_rotation_angle < 0) {
        target_rotation_angle += 360;
    }
    if (abs(target_rotation_angle - rotation_angle) > 180) {
        if (target_rotation_angle > rotation_angle) {
            target_rotation_angle -= 360;
        } else {
            target_rotation_angle += 360;
        }
    }

    // Interpolate the rotation angle towards the target angle
    rotation_angle = lerp(rotation_angle, target_rotation_angle, tween_factor);

    // Wrap the rotation angle
    if (rotation_angle >= 360) {
        rotation_angle -= 360;
    } else if (rotation_angle < 0) {
        rotation_angle += 360;
    }

    // Find the item with the largest scale (closest to the viewer)
    var largest_scale = 0;
    for (var i = 0; i < num_items; i++) {
        var item = items[i];
        var angle = (rotation_angle + i * angle_step) * pi / 180; // Convert angle to radians

        // Calculate the scale factor based on angle
        var item_scale = 1 - abs(sin(angle)) * 0.5;

        // Check if this item has the largest scale
        if (item_scale > largest_scale) {
            largest_scale = item_scale;
            selected_item = item;
        }
    }

    // Draw each item in the carousel
    for (var i = 0; i < num_items; i++) {
        var item = items[i];
        var angle = (rotation_angle + i * angle_step) * pi / 180; // Convert angle to radians

        // Calculate the position of the item
        var item_x = center_x + cos(angle) * radius;
        var item_y = center_y + sin(angle) * radius;

        // Calculate the scale and rotation for the 3D effect
        var item_scale = 1 - abs(sin(angle)) * 0.5; // Scale factor based on angle
        var item_rotation = angle * 180 / pi; // Rotation angle in degrees

        // Draw the item with scaling and rotation
        if (item != selected_item) {
            item.shape_color = c_gray;
            item.x = item_x;
            item.y = item_y;
            item.shape_size = item_scale * 200;
        } else if (item == selected_item) {
            // Draw the selected item larger and with a different color
            item.shape_color = c_yellow;
            item.x = item_x;
            item.y = item_y;
            item.shape_size = item_scale * 200;

            draw_set_halign(fa_center);
            draw_set_valign(fa_bottom);
            draw_text_color(item_x, item_y + 32 * item_scale, item.text, item.shape_color, item.shape_color, item.shape_color, item.shape_color, 1);

            if keyboard_check_pressed(vk_enter) {
                switch (i) {
                    case 0: show_message("Play"); break;
                    case 1: show_message("OPTION"); break;
                    case 2: game_end(); break;
                }
            }
        }
    }
}
