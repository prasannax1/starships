use <macs.scad>;

module macs_large_shuttle() {
    union() {
        translate([1.25 + 4, 0, 0]) macs_pod();
        macs_extra_room();
        translate([-2 - 4, 0, 0]) macs_small_warp();
    }
}


macs_large_shuttle();

