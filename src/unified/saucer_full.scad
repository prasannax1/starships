use <disks.scad>
use <engines.scad>
include <common.scad>

module saucer_full() {
    translate([disk_4_width/2+class_4_nacelle_w/3,0,class_4_nacelle_w*.4-.01])
    disk_4();

    translate([class_4_nacelle_w,0,class_4_nacelle_w*.4-.01+disk_4_height-disk_3_height/2]) disk_1();

    class_4_secondary();
}

saucer_full();