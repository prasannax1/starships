use <macs.scad>;

module macs_small_shuttle() {
    union() {
        translate([1.25,0,0]) macs_pod();
        translate([-2,0,0]) macs_small_warp();
    }
}

macs_small_shuttle();
