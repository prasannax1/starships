use <disk2.scad>
use <disk0.scad>
use <reverse_yacht_small.scad>;

module command_saucer() {
    disk_2();
    
    translate([0,0,.01])
    disk_0_under_2();
}

command_saucer();