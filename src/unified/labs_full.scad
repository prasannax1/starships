use <disks.scad>
use <engines.scad>
include <common.scad>
use <../lib/util.scad>
use <labs.scad>;
use <mini_escort.scad>;

module labs_full() {
    translate([.45*disk_3_width,0,0])
    labs();

    class_3_secondary();
    
    translate([-class_3_secondary_l*.28, 0, -1.5+.02]) 
    mini_escort();
}

labs_full();