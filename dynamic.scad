height_bottom = 7.5;
height = 30;

bottom = 82/2 + 1.6;
top = 74/2 + 0.8;
outer = 95/2;
outer_top = 87/2;
ring = 74/2;

rotate_extrude()
polygon(points=[
    [bottom, 0],
    [bottom, height_bottom],
    [ring, height_bottom],
    [top, height_bottom + top - ring],
    [top, height],
    [outer_top, height],
    [outer_top, height * 2/3],
    [outer, height * 1/3],
    [outer, 0],
]);
