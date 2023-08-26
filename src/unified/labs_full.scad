use <disks.scad>
use <engines.scad>
include <common.scad>
use <../lib/util.scad>
use <labs.scad>;
use <attack.scad>;

module labs_full() {
    translate([.45*disk_3_width,0,0])
    labs();

    class_3_secondary();
}

labs_full();