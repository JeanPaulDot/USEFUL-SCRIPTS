/// @desc Shape Manager

#region Cube
// Example usage for a cube
cube_vertices = [
    -0.5, -0.5, -0.5, // 0
    0.5, -0.5, -0.5,  // 1
    0.5, 0.5, -0.5,   // 2
    -0.5, 0.5, -0.5,  // 3
    -0.5, -0.5, 0.5,  // 4
    0.5, -0.5, 0.5,   // 5
    0.5, 0.5, 0.5,    // 6
    -0.5, 0.5, 0.5    // 7
];

cube_edges = [
    0, 1, 1, 2, 2, 3, 3, 0, // Front face
    4, 5, 5, 6, 6, 7, 7, 4, // Back face
    0, 4, 1, 5, 2, 6, 3, 7  // Side edges
];
#endregion;

#region Pyramid
// Pyramid vertices
pyramid_vertices = [
    0.0, 0.0, 1.0,   // 0 (top)
    -0.5, -0.5, -0.5, // 1
    0.5, -0.5, -0.5, // 2
    0.5, 0.5, -0.5,  // 3
    -0.5, 0.5, -0.5  // 4
];

// Pyramid edges
pyramid_edges = [
    0, 1, 0, 2, 0, 3, 0, 4, // Edges connecting top vertex to base vertices
    1, 2, 2, 3, 3, 4, 4, 1 // Edges forming the base
];
#endregion

#region Tetrahedron

tetrahedron_vertices = [
    0.0, 0.0, 1.0, 0.5, 0.5, -0.5, -0.5, 0.5, -0.5, -0.5, -0.5, -0.5
];
tetrahedron_edges = [
    0, 1, 0, 2, 0, 3, 1, 2, 2, 3, 3, 1
];
#endregion

#region Octahedron


octahedron_vertices = [
    1.0, 0.0, 0.0, -1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, -1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, -1.0
];
octahedron_edges = [
    0, 2, 0, 3, 0, 4, 0, 5, 1, 2, 1, 3, 1, 4, 1, 5, 2, 4, 3, 5
];
#endregion

#region Dodec

dodecahedron_vertices = [
    0.0, 0.0, 1.5, 0.0, 0.0, -1.5, 0.5, 0.86603, 0.0, -0.5, 0.86603, 0.0, -0.5, -0.86603, 0.0,
    0.5, -0.86603, 0.0, 0.86603, 0.0, 0.5, -0.86603, 0.0, -0.5, -0.86603, 0.0, 0.5, 0.0, 0.86603, 0.5,
    0.0, -0.86603, -0.5
];
dodecahedron_edges = [
    0, 1, 0, 4, 0, 6, 0, 8, 0, 9, 1, 2, 1, 3, 1, 7, 2, 5, 2, 8, 3, 4, 3, 6, 4, 10, 5, 7, 5, 10, 6, 9,
    7, 11, 8, 11, 9, 11, 10, 11
];
#endregion

#region Icosahedron

icosahedron_vertices = [
    0.0, 0.0, 1.0, 0.89442, 0.0, 0.44721, -0.27639, 0.85065, 0.44721, -0.89442, 0.0, 0.44721, 0.27639, 0.85065, 0.44721,
    -0.89442, 0.0, -0.44721, 0.27639, -0.85065, -0.44721, 0.89442, 0.0, -0.44721, -0.27639, -0.85065, -0.44721, 0.0, 0.0, -1.0
];
icosahedron_edges = [
    0, 1, 0, 4, 0, 5, 0, 10, 1, 2, 1, 6, 2, 3, 2, 7, 3, 4, 3, 8, 4, 9, 5, 6, 5, 10, 6, 7, 7, 8, 8, 9, 9, 10
];
#endregion

// Shape properties
shape = 0; // 0 = Cube, 1 = Pyramid, 2 = Tetrahedron, ...
shape_size = 100;
shape_color = c_white;
rotate_speed = 0.05;


// Array to store all shape vertex and edge arrays
all_shapes = [
    [cube_vertices, cube_edges],
	[pyramid_vertices, pyramid_edges],
	[tetrahedron_vertices,tetrahedron_edges],
	[octahedron_vertices,octahedron_edges],
	[dodecahedron_vertices,dodecahedron_edges],
	[icosahedron_vertices,icosahedron_edges]

];

