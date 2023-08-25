use <command_simple.scad>;
use <engines.scad>;
include <common.scad>;

module dreadnaught() {
    translate([disk_2_width/2-.01,0,20-.01])
    command_simple();
    
    class_2_secondary();
}

dreadnaught();