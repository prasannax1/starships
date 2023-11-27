use <disks.scad>
use <engines.scad>
include <common.scad>
use <../lib/util.scad>
use <mini_escort.scad>;

module labs_secondary(theta) {
    class_3_secondary(theta);
    
    translate([-class_3_secondary_l*.28, 0, -1.5+.02]) 
    mini_escort();
}

labs_secondary(75);