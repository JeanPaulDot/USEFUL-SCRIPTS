/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
#region Icosahedron

icosahedron_vertices = [
    0.0, 0.0, 1.0, 0.89442, 0.0, 0.44721, -0.27639, 0.85065, 0.44721, -0.89442, 0.0, 0.44721, 0.27639, 0.85065, 0.44721,
    -0.89442, 0.0, -0.44721, 0.27639, -0.85065, -0.44721, 0.89442, 0.0, -0.44721, -0.27639, -0.85065, -0.44721, 0.0, 0.0, -1.0
];
icosahedron_edges = [
    0, 1, 0, 4, 0, 5, 0, 10, 1, 2, 1, 6, 2, 3, 2, 7, 3, 4, 3, 8, 4, 9, 5, 6, 5, 10, 6, 7, 7, 8, 8, 9, 9, 10
];
#endregion

icos = [icosahedron_vertices, icosahedron_edges];

shape_size = 100;
shape_color = c_white;
rotate_speed = 0.05;
text = "STRANGE";