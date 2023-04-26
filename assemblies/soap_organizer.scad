include <../parts/organizer.scad>
include <../parts/tray.scad>

organizer();

translate([0, 0, -$t*20])
tray();
