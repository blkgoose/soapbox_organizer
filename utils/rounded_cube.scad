module rounded_cube(size, fillet=3, center=false) {
    x=size[0]-fillet*2;
    y=size[1]-fillet*2;
    z=size[2]-fillet*2;

    to_center_if_needed = (!center) ?
        [fillet, fillet, fillet] :
        [-x/2, -y/2, -z/2];

    translate(to_center_if_needed)
    hull() {
        sphere(fillet);

        translate([x, 0, 0])
        sphere(fillet);

        translate([0, y, 0])
        sphere(fillet);
        
        translate([x, y, 0])
        sphere(fillet);

        translate([0, 0, z])
        sphere(fillet);

        translate([x, 0, z])
        sphere(fillet);
        
        translate([0, y, z])
        sphere(fillet);
        
        translate([x, y, z])
        sphere(fillet);
    }
}
