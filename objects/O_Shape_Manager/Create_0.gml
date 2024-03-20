/// @desc Shape Manager

shapes_load();
all_shapes = [
    [cube_vertices, cube_edges],
	[pyramid_vertices, pyramid_edges],
	[tetrahedron_vertices,tetrahedron_edges]/*,
	[octahedron_vertices,octahedron_edges],
	[dodecahedron_vertices,dodecahedron_edges],
	[icosahedron_vertices,icosahedron_edges]*/

];

// Shape properties
shape_size = 50;
shape_color = c_white;
rotate_speed = 0.05;

num_shapes = array_length(all_shapes);
selected_shape = 0;

// Carousel properties
carousel_x = room_width / 2;
carousel_y = room_height / 2;
carousel_radius = 300;
carousel_angle = 0;
carousel_angle_speed = 0.01;

// Calculate the angle step between each shape
angle_step = 360 / num_shapes;






