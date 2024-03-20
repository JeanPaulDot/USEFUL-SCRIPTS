/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

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
pyramid = [pyramid_vertices, pyramid_edges];

shape_size = 100;
shape_color = c_white;
rotate_speed = 0.5;
text = "/OPTIONS/";