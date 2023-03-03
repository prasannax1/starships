use <disks.scad>
use <engines.scad>;
include <common.scad>;
use <../lib/util.scad>;

module command_full() {
    translate([disk_2_width/2-.01,0,-.01])
    disk_2();
    
    class_2_secondary();
}

command_full();