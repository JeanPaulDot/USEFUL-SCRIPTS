/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

#region Tetrahedron

tetrahedron_vertices = [
    0.0, 0.0, 1.0, 0.5, 0.5, -0.5, -0.5, 0.5, -0.5, -0.5, -0.5, -0.5
];
tetrahedron_edges = [
    0, 1, 0, 2, 0, 3, 1, 2, 2, 3, 3, 1
];
#endregion

tetrahedron = [tetrahedron_vertices, tetrahedron_edges];

shape_size = 100;
shape_color = c_white;
rotate_speed = 0.15;
text = "/QUIT/";
