include <../utils/rounded_cube.scad>
include <../vitamins/soap_bar.scad>

number_of_soap_bars = 4;
organizer_wall_thick = 3;
organizer_width = (soap_height+organizer_wall_thick)*number_of_soap_bars+organizer_wall_thick;
organizer_depth = soap_depth;
organizer_height = 70;

holes_spacing = 5;
holes_size = 3;

tray_height = 10;

if ($preview) {
    $fn=5;
} else {
    $fn=300;
}

module organizer() {
    translate([soap_height/2, soap_depth/2, 0])
    difference() {
        translate([organizer_width/2-soap_height/2, 0, 0])
        rounded_cube([organizer_width, organizer_depth, organizer_height], fillet=4, center=true);

        for ( i = [ 0 : number_of_soap_bars-1 ] ) {
            translate([(soap_height+organizer_wall_thick)*i, 0, soap_width/2-organizer_height/2])
            union() {
                translate([organizer_wall_thick, -organizer_wall_thick, organizer_wall_thick])
                rotate([0, 90, 0])
                soap_bar();

                // drain holes
                render() {
                    translate([-soap_height/2+organizer_wall_thick, -soap_depth/2-organizer_wall_thick, -soap_width/2])
                    intersection() {
                        for ( i = [ 0 : soap_height/(holes_size+holes_spacing) ] ) {
                            for ( j = [ 0 : soap_depth/(holes_size+holes_spacing) ] ) {
                                translate([(holes_spacing+holes_size)*i, (holes_spacing+holes_size)*j, 0])
                                cylinder(d=holes_size, h=100, center=true); 
                            }
                        }
                        
                        translate([soap_height/2, soap_depth/2, 0])
                        rotate([0, 90, 0])
                        soap_bar();
                    }
                }
            }
        }
    }
}
