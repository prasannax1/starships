include <common.scad>
use <disk1.scad>
use <engine5.scad>

module warp() {    
    class_5_secondary();
    
    translate([1.5*disk_1_width,0,disk_1_width/2-.01])
    disk_1();
}

warp();