function draw_3d_cube(vertices, edges,shape_x,shape_y,shape_size_x,shape_size_y,rotation_speed) {
    
	
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

/*
function draw_carousel(items, center_x, center_y, radius, rotation_speed) {
    static rotation_angle = 0;
    
    // Number of items in the carousel
    var num_items = array_length(items);
    
    // Angle between each item
    var angle_step = 360 / num_items;
    
    // Handle key input
    if (keyboard_check_pressed(vk_left)) {
        rotation_angle += angle_step;
    } else if (keyboard_check_pressed(vk_right)) {
        rotation_angle -= angle_step;
    }
    
    // Wrap the rotation angle
    if (rotation_angle >= 360) {
        rotation_angle -= 360;
    } else if (rotation_angle < 0) {
        rotation_angle += 360;
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
        
 
			draw_set_color(c_yellow);
			item.x = item_x;
			item.y = item_y;
			item.shape_size = item_scale * 200
	        // Draw the associated text
	        draw_set_halign(fa_center);
	        draw_set_valign(fa_bottom);
	        draw_text(item_x, item_y + 32 * item_scale, item.text);
		
	
    }
}

*/

function draw_carousel(items, center_x, center_y, radius, rotation_speed) {
    static rotation_angle = 0;
    static selected_item = noone; // Initialize selected item to none
    
    // Number of items in the carousel
    var num_items = array_length(items);
    
    // Angle between each item
    var angle_step = 360 / num_items;
    
    // Handle key input
    if (keyboard_check_pressed(vk_left)) {
        rotation_angle += angle_step;
    } else if (keyboard_check_pressed(vk_right)) {
        rotation_angle -= angle_step;
    }
    
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
			item.shape_size = item_scale * 200
		
        } else if (item == selected_item) {
            // Draw the selected item larger and with a different color
          
			item.shape_color = c_yellow;
			item.x = item_x;
			item.y = item_y;
			item.shape_size = item_scale * 200
	        draw_set_halign(fa_center);
	        draw_set_valign(fa_bottom);
	        draw_text_color(item_x, item_y + 32 * item_scale, item.text,item.shape_color,item.shape_color,item.shape_color,item.shape_color,1);
				if keyboard_check_pressed(vk_enter){
					switch(i) {
						case 0 : show_message("Play") break
						case 1 : show_message("OPTION") break
						case 2 : game_end() break

					}
				}
		}
    }
}