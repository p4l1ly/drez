include <threadlib/threadlib.scad>; // Make sure you have this library installed

// Customize the dimensions
inner_diameter = 67; // mm
outer_diameter = 74; // mm
height = 16 + 8.5; // mm
thread = "M12";
turns = 5;
scratch_depth = 0.8;
scratch_height = 3;
scratch_z = 2;
center_diameter = 12;

module cylinder_segment(radius1, radius2, height, angle) {
    rotate_extrude(angle=angle)
    translate([radius1,0,0])
    square([radius2 - radius1, height], center=false);
}

difference() {
    union() {
        difference() {
            // Outer Cylinder
            cylinder(h = height, r = outer_diameter/2);

            // Inner Cylinder for Side Thickness
            translate([0, 0, -1])
            cylinder(h = height + 2, r = inner_diameter/2);
        }
        nut(thread, turns=turns, Douter=outer_diameter);
    }

    translate([0, 0, scratch_z]) {
        rotate_extrude()
        translate([outer_diameter/2 - scratch_depth,0,0])
        polygon(points=[
            [scratch_depth + 1,-1],
            [0, scratch_depth],
            [0, scratch_height - scratch_depth],
            [scratch_depth + 1, scratch_height + 1],
        ]);
    }

    translate([0, 0, -1])
    cylinder_segment(center_diameter, inner_diameter/2, height + 2, 100);

    rotate([0, 0, 120])
    translate([0, 0, -1])
    cylinder_segment(center_diameter, inner_diameter/2, height + 2, 100);

    rotate([0, 0, 240])
    translate([0, 0, -1])
    cylinder_segment(center_diameter, inner_diameter/2, height + 2, 100);
}

