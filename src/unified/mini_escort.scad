use <disks.scad>;
use <engines.scad>;
include <common.scad>;
use <../lib/util.scad>;

module mini_escort() {
    mirror([0,0,1])
    disk_point_5();

    util_mirrored([0,1,0])
    translate([-class_0_nacelles_l*.4, disk_0_width/2-2*class_0_nacelles_w,-.5*class_0_nacelles_w])
    rotate([-45,0,0])
    translate([0,class_0_nacelles_w/2,0])
    class_0_double_nacelle();
}

mini_escort();