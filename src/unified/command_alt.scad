use <disks.scad>
use <engines.scad>;
include <common.scad>;
use <../lib/util.scad>;

module command_alt() {
    disk_2();
    
    util_mirrored([0,1,0])
    translate([-disk_2_width/4+10,disk_2_width/4,0])
    class_1_assembly();
}

command_alt();