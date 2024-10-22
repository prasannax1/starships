use <../lib/util.scad>
include <common.scad>

module window() {
    translate([2,0,0])
    cube([5, 2, 1], center=true);
}

module porthole() {
    translate([2,0,0])
    rotate([0,90,0])
    cylinder(d=.75, h=5, center=true, $fn=12);
}

