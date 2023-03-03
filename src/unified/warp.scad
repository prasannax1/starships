include <common.scad>
use <disks.scad>
use <engines.scad>

module warp() {
    translate([class_4_nacelle_w*.8,0,class_4_nacelle_w*.4-.01])
    disk_1();
    
    class_4_secondary();
}

warp();