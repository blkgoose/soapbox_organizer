include <../utils/rounded_cube.scad>

soap_width = 100;
soap_depth = 70;
soap_height = 40;

module soap_bar() {
    rounded_cube([soap_width, soap_depth, soap_height], center=true);
}
