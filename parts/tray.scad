include <organizer.scad>

module tray() {
    difference() {
        translate([0, 0, -(organizer_height)/2-tray_height+organizer_wall_thick])
        intersection() {
            organizer();
            cube([organizer_width, organizer_depth, tray_height]);
        }

        organizer();
    }
}
