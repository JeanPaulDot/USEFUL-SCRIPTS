/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

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

cube = [cube_vertices, cube_edges];

shape_size = 100;
shape_color = c_white;
rotate_speed = 0.05;
text = "/PLAY/";