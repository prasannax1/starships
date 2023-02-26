include <common.scad>
use <disks.scad>
use <engines.scad>

module scout_simple() {
    intersection() {
        disk_1();
        translate([0,0,disk_1_width/2])
        cube(disk_1_width, center=true);
    }

    class_1_assembly();
}

scout_simple();