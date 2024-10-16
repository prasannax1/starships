use <disks.scad>
use <engines.scad>
include <common.scad>
use <../lib/util.scad>
use <labs.scad>;
use <labs_secondary.scad>;
use <mini_escort.scad>;

module labs_full() {
    translate([.45*disk_3_width,0,0])
    labs();

    labs_secondary(75);
}

labs_full();