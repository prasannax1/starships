use <../lib/util.scad>
use <disk0.scad>
use <engine0.scad>
include <common.scad>

module attack() {
    disk_0();

    util_mirrored([0,1,0])
    translate([-2.45, disk_0_width*.31, 1.25])
    rotate([90,0,0]) {
        class_0_secondary();
        translate([-disk_0_width*.75,0,class_0_nacelles_w*.35])
        class_0_double_nacelle();
    }
}

attack();