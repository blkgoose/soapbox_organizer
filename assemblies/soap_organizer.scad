include <../parts/organizer.scad>
include <../parts/tray.scad>

organizer();

translate([0, 100, tray_height])
tray();
