use <macs.scad>;

module macs_fast_shuttle() {
    union() {
        translate([1.25 + 8, 0, 0]) macs_pod();
        macs_large_warp();
    }
}

macs_fast_shuttle();
